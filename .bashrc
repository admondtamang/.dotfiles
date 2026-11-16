
# killport
killport() { kill -9 $(lsof -t -i :"${1:-3000}") 2>/dev/null && echo "Killed port ${1:-3000}" || echo "Nothing on port ${1:-3000}"; }

# Git pull and push
gppush() {
  local branch
  branch=$(git rev-parse --abbrev-ref HEAD 2>/dev/null) || { echo "Not a git repo"; return 1; }
  git pull origin "$branch" -r && git push
}
