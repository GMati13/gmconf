#!/usr/bin/env python3.7
from argparse import ArgumentParser
from pathlib import Path
import os

top_parser = ArgumentParser(prog='tmuxto')

top_subparser = top_parser.add_subparsers(title='action', dest='action', required=True)

start_parser = top_subparser.add_parser('start')
start_parser.add_argument('socket', type=str)
start_parser.add_argument('sessions', type=str, nargs='*')

attach_parser = top_subparser.add_parser('attach')
attach_parser.add_argument('socket', type=str)
attach_parser.add_argument('session', type=str)

kill_parser = top_subparser.add_parser('kill')
kill_parser.add_argument('socket', type=str)
kill_parser.add_argument('sessions', type=str, nargs='*')

list_parser = top_subparser.add_parser('list')
list_parser.add_argument('socket', type=str, nargs='*')

parsed_args = top_parser.parse_args()

do_action = {
    'start': lambda: start_session(parsed_args.socket, parsed_args.sessions),
    'attach': lambda: attach_session(parsed_args.socket, parsed_args.session),
    'kill': lambda: kill_session(parsed_args.socket, parsed_args.sessions),
    'list': lambda: list_sessions(parsed_args.socket),
}

def start_session(socket, sessions):
    projects_folder = Path.joinpath(Path.home(), 'Projects')
    project_folder = Path.joinpath(Path.home(), 'Projects/{}'.format(socket))
    config_template = '.tmux/tmux-{}{}.conf'
    
    if not Path.exists(projects_folder):
        print('no such directory: {}'.format(projects_folder))
        exit()

    if not Path.exists(project_folder):
        print(os.mkdir(str(project_folder)))

    def start(socket, session, folder, config_template):
        has_session = os.system('tmux -L "{}" has -t="{}" > /dev/null 2>&1'.format(socket, session)) == 0

        if has_session:
            print('session "{}" already exists'.format(session))
        else:
            os.chdir(str(project_folder))
            os.system('tmux -L "{}" new-session -d -s "{}" -n "shell"'.format(socket, session))

            config_file = Path.joinpath(Path.home(), config_template.format(session))
            if not Path.exists(config_file):
                print('no such file "{}"'.format(str(config_file)))
            else:
                os.system('tmux -L "{}" source-file "{}'.format(socket, str(config_file)))
            print('session "{}" started'.format(session))

    if not sessions:
        start(socket, socket, project_folder, config_template.format(socket, ''))
    else:
        for session in sessions:
            start(socket, session, Path.joinpath(project_folder, session),
                    config_template.format(socket, '-{}'))

def attach_session(socket, session):
    if session:
        os.system('tmux -L "{}" attach-session -t "{}"'.format(socket, session))
    else:
        os.system('tmux -L "{0}" attach-session -t "{0}"'.format(socket))

def kill_session(socket, sessions):
    if sessions:
        for session in sessions:
            os.system('tmux -L "{}" kill-session -t "{}"'.format(socket, session))
    else:
        os.system('tmux -L "{}" kill-server'.format(socket))

def list_sessions(sockets):
    if not sockets:
        os.system('lsof -U 2> /dev/null | sed -n "s/^tmux.*tmux-1000\\/\\([^\\ ]*\).*/\\1/p" | sort -u')
    else:
        for socket in sockets:
            all_sockets = os.popen('lsof -U 2> /dev/null | sed -n "s/^tmux.*tmux-1000\\/\\({}\\).*/\\1/p" | sort -u'.format(
                socket)).read().strip().split('\n')
            if socket in all_sockets:
                print('sessions into socket "{}"'.format(socket))
                os.system('tmux -L "{}" ls'.format(socket))
            else:
                print('no such socket "{}"'.format(socket))

do_action[parsed_args.action]()
