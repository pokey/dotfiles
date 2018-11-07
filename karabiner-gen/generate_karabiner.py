#!/usr/bin/env python
import json
import os

import yaml

UK_TO_US_MODIFICATIONS = {
    'return_or_enter': 'backslash',
    'backslash': 'return_or_enter',
    'non_us_backslash': 'grave_accent_and_tilde',
}


config_yaml = os.path.expanduser('~/.config/pokey/config.yaml')
if os.path.exists(config_yaml):
    with open(config_yaml) as f:
        pokey_config = yaml.load(f)
else:
    pokey_config = dict()

with open('karabiner.yaml') as f:
    complex_modifications_input = yaml.load(f)

with open('karabiner-input.json') as f:
    config = json.load(f)

complex_modifications = [
    {
        'type': 'basic',
        'from': {'key_code': mapping['from']},
        'to': [mapping['to']],
        'conditions': [
            {
                'type': 'variable_if',
                'name': 'launcher_mode',
                'value': 1
            }
        ]
    }
    for mapping in complex_modifications_input['launcher_mode']
]

rule = (
    config['profiles'][0]['complex_modifications']['rules'][0]
)
rule['manipulators'] = complex_modifications + rule['manipulators']

simple_modifications = config['profiles'][0]['simple_modifications']
if pokey_config.get('uk_to_us_keyboard'):
    simple_modifications += [
        {
            "from": {"key_code": key},
            "to": {"key_code": value}
        }
        for key, value in UK_TO_US_MODIFICATIONS.items()
    ]

out = json.dumps(
    config,
    sort_keys=True,
    indent=4,
    separators=(',', ': ')
)
print(out)
