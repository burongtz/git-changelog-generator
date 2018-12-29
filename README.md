# Git Changelog Generator
A generator of CHANGELOG.md file using git commits.
The chnage log is going to be generated using \
`git log --no-merges --date='format-local:%Y-%m-%d %H:%M:%S' --pretty=format:'%cd | %h | %s' | grep -e 'Added:' -e 'Fixed:'`

# Instalation

# Types Of Changes 
[Keep A Changelog](https://keepachangelog.com/en/1.0.0/) - 2018-12-28
- **Added** for new features.
- **Changed** for changes in existing functionality.
- **Deprecated** for soon-to-be removed features.
- **Removed** for now removed features.
- **Fixed** for any bug fixes.
- **Security** in case of vulnerabilities.

# How to use
`javier@javier:~/burongtz-github/git-changelog-generator$ sh src/linux/main.sh`
