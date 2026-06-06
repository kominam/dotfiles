#!/usr/bin/env bash

input=$(cat)
cwd=$(echo "$input" | jq -r '.workspace.current_dir // empty')
[ -z "$cwd" ] && cwd=$(pwd)
cwd="${cwd##*/}"
model=$(echo "$input" | jq -r '.model.display_name // empty')
cost=$(echo "$input" | jq -r '.cost.total_cost_usd // 0')

BLUE='\033[1;34m'
YELLOW='\033[1;33m'
CYAN='\033[0;36m'
MAGENTA='\033[0;35m'
GREEN='\033[0;32m'
RED='\033[0;31m'
RESET='\033[0m'

# Git branch
git_branch=""
if git rev-parse --git-dir >/dev/null 2>&1; then
  git_branch=$(git branch --show-current 2>/dev/null || git rev-parse --short HEAD 2>/dev/null)
fi

# Context window usage
used_pct=$(echo "$input" | jq -r '.context_window.used_percentage // empty')

# Rate limits
five_pct=$(echo "$input" | jq -r '.rate_limits.five_hour.used_percentage // empty')
seven_pct=$(echo "$input" | jq -r '.rate_limits.seven_days.used_percentage // empty')

# ---- severity emoji (no colors) ----
get_severity_emoji() {
  local pct="$1"
  if [ "$pct" -ge 90 ] 2>/dev/null; then
    echo "🔴"      # Critical
  elif [ "$pct" -ge 70 ] 2>/dev/null; then
    echo "🟡"      # Warning
  else
    echo "🟢"      # Healthy
  fi
}

progress_bar() {
  pct="${1:-0}"; width="${2:-20}"
  [[ "$pct" =~ ^[0-9]+$ ]] || pct=0; ((pct<0))&&pct=0; ((pct>100))&&pct=100
  filled=$(( pct * width / 100 )); empty=$(( width - filled ))
  # ▰ (U+25B0) filled, ▱ (U+25B1) empty - smooth horizontal rectangles
  for ((i=0; i<filled; i++)); do printf '▰'; done
  for ((i=0; i<empty; i++)); do printf '▱'; done
}

# cwd
printf " ${BLUE}%s${RESET}" "$cwd"

# git branch
if [ -n "$git_branch" ]; then
  printf " ${YELLOW} %s${RESET}" "$git_branch"
fi

# model
if [ -n "$model" ]; then
  printf " ${CYAN}[%s]${RESET}" "$model"
fi

# context usage
if [ -n "$used_pct" ]; then
  ctx_emoji=$(get_severity_emoji "$used_pct")
  progress=$(progress_bar "$used_pct")

  printf " ${ctx_emoji} ${progress} ${GREEN}ctx:%.0f%%${RESET}" "$used_pct"
fi

# cost
if [ -n "$cost" ]; then
  printf " ${MAGENTA}cost:$%.4f${RESET}" "$cost"
fi

# rate limit
if [ -n "$five_pct" ]; then
  printf " ${RED} 5H:%.0f%% (1W:%.0f%%) ${RESET}" "$five_pct" "$seven_pct"
fi

printf "\n"
