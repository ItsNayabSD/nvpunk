from subprocess import STDOUT, Popen, PIPE
from pathlib import Path


def get_version(java_exec: str) -> int:
    out, _ = Popen(
        [java_exec, '-version'], stdout=PIPE, stderr=STDOUT
    ).communicate()
    lines = [
        line for line in out.decode().split('\n')
        if 'version' in line and '"' in line and '.' in line
    ]
    if not any(lines):
        return 0
    return int(lines[0].split('"')[1].split('.')[0])


jvm_dir = Path('/usr/lib/jvm/')

for dir in jvm_dir.iterdir():
    if get_version(str(dir.joinpath('bin/java'))) == 17:
        print(dir)
        exit(0)
