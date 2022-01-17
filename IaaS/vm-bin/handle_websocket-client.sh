#!/bin/bash

FIFO=/var/run/pushnot_fifo

function forward_from_stdin_to_fifo {
  local inMessage=
  while IFS=$'\n' read inMessage; do
    [[ -n "${inMessage}" ]] && printf '%s\n' "${inMessage}" >> "${FIFO}"
  done
}

function forward_from_fifo_to_stdout {
  local inMessage=
  while read -r inMessage < "${FIFO}"; do
   [[ -n "${inMessage}" ]] && printf '%s\n' "${inMessage}" 
  done
}

forward_from_fifo_to_stdout &
forward_from_stdin_to_fifo 


