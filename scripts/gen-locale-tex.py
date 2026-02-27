#!/usr/bin/env python3
"""
gen-locale-tex.py — Generate LaTeX \\newcommand definitions from a JSON locale file.

Usage: python3 gen-locale-tex.py <locale.json>
Output: LaTeX commands to stdout

Each JSON key is converted from snake_case to CamelCase and prefixed with 'lang'.
Example: "post_breakfast" -> \\langPostBreakfast
"""

import json
import sys


def snake_to_camel(name: str) -> str:
    """Convert snake_case to CamelCase."""
    return ''.join(word.capitalize() for word in name.split('_'))


def main():
    if len(sys.argv) != 2:
        print(f"Usage: {sys.argv[0]} <locale.json>", file=sys.stderr)
        sys.exit(1)

    with open(sys.argv[1], encoding='utf-8') as f:
        data = json.load(f)

    print(f"% Auto-generated from {sys.argv[1]}")
    print("% Do not edit manually.\n")

    for key, value in data.items():
        cmd_name = f"lang{snake_to_camel(key)}"
        print(f"\\newcommand{{\\{cmd_name}}}{{{value}}}")


if __name__ == '__main__':
    main()
