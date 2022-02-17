#!/usr/bin/env python3
# Note: generate initial raw transcript using eg
#
# cat 'path/2022-02-17T14-52-51/talon-log.jsonl' \
#   | jq -c 'select(.type == talonCommandPhrase) | {phrase, phraseStart: .timeOffsets.speechStart, phraseEnd: .timeOffsets.prePhraseCallbackStart}' \
#   > 'path/raw-transcript.jsonl'
#
# And then remove anything you don't want

import json
from math import floor

offset = 78 - 80.06904987200323


with open("/Users/pokey/Movies/Cursorless/Completed/Two Sum/raw-transcript.jsonl") as f:
    raw_transcript = [json.loads(line) for line in f]


def format_time_stamp(total_seconds: float):
    hours, remainder = divmod(total_seconds, 3600)
    minutes, seconds = divmod(remainder, 60)
    milliseconds = floor((seconds * 1000) % 1000)
    return f"{int(hours):02}:{int(minutes):02}:{floor(seconds):02},{milliseconds:03}"


transcript_items = [
    f"""
{index + 1}
{format_time_stamp(item["phraseStart"] + offset)} --> {format_time_stamp(item["phraseEnd"] + offset)}
{item["phrase"]}
    """.strip()
    for index, item in enumerate(raw_transcript)
]

print("\n\n".join(transcript_items))
