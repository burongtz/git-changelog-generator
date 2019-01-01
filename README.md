# Git CHANGELOG Generator
A generator of CHANGELOG.md file using git commits.
The chnage log is going to be generated using\
`git log --no-merges --date='tformat-local:%Y-%m-%d %H:%M:%S' --pretty=format:'%cd | %h | %s'`

## Instalation
To use this script easily clone this project to your $HOME\

**Steps**
- Clone this project to your /home/user_name\
`javier@javier:~$ git clone https://github.com/burongtz/git-changelog-generator.git changelogmd`
- Set permission to run the script\
`javier@javier:~$ chmod +x /home/javier/changelogmd/src/linux/main.sh"`
- Crete the alias changelogmd in file `~/.bashrc`\
`alias changelogmd="/home/javier/changelogmd/src/linux/main.sh"`

## Types Of Changes 
[Keep A Changelog](https://keepachangelog.com/en/1.0.0/) - 2018-12-28
- **Added** for new features.
- **Changed** for changes in existing functionality.
- **Deprecated** for soon-to-be removed features.
- **Removed** for now removed features.
- **Fixed** for any bug fixes.
- **Security** in case of vulnerabilities.

## How to use
The script only works if in subject of commit message you write one token, of the list in [Types of changes](https://github.com/burongtz/git-changelog-generator/blob/dev/README.md#types-of-changes), at beginning of string.\
Example: \
`$ git commit -m "Added: module to edit profile"`

**Generate CHANGELOG of all project**\
`$ changelogmd `

**Generate CHANGLOG from revision range**\
It's possible using as git [revision of Git log](https://git-scm.com/docs/git-log#git-log-ltrevisionrangegt) documentation.

From commit - to commit.\
`$ changelogmd path/of/git/porject/ origin..HEAD`

From commit - to last commit\
`$ changelogmd path/of/git/porject/ origin..`

From first commit - to commit\
`$ changelogmd path/of/git/porject/ HEAD`

The origin and HEAD could be a tag or hash of commit
