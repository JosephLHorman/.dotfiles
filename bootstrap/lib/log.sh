#!/usr/bin/env bash
# Logging for the mise tasks in bootstrap/tasks/. Safe to source twice.

[[ -n ${_DOTFILES_LOG_SH:-} ]] && return 0
_DOTFILES_LOG_SH=1

if [[ -t 1 && -z ${NO_COLOR:-} ]]; then
  _c_reset=$'\033[0m'; _c_dim=$'\033[2m'; _c_red=$'\033[31m'
  _c_green=$'\033[32m'; _c_yellow=$'\033[33m'; _c_blue=$'\033[34m'
else
  _c_reset=''; _c_dim=''; _c_red=''; _c_green=''; _c_yellow=''; _c_blue=''
fi

log_step()  { printf '%s==>%s %s\n' "$_c_blue"    "$_c_reset" "$*"; }
log_info()  { printf '    %s\n' "$*"; }
log_ok()    { printf '%s  ok%s %s\n' "$_c_green"  "$_c_reset" "$*"; }
log_skip()  { printf '%s skip%s %s\n' "$_c_dim"   "$_c_reset" "$*"; }
log_warn()  { printf '%s warn%s %s\n' "$_c_yellow" "$_c_reset" "$*" >&2; }
log_error() { printf '%sfail%s %s\n' "$_c_red"    "$_c_reset" "$*" >&2; }

die() { log_error "$*"; exit 1; }
