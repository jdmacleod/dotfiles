#
#------------------------------------------------------------------------------
#	System provided aliases
#------------------------------------------------------------------------------
alias	a	alias
a	b	popd
a	cp	cp -p
a	h	history 50
#a	ls	'ls -AF'
a	la	'ls -a'
a	lt	'ls -ltr'
a	lsa	'ls -latrh'
a	lo	exit
a	m	more
a	p	pushd .
a	so	source
a	to	'rlogin \!$ -l $USER'
a	ua	unalias
#------------------------------------------------------------------------------
#	Add your own personal alias here
#------------------------------------------------------------------------------

#echo "sourcing personal aliases"
source ~/.alias

setenv PRINTER fas1220

setenv EDITOR vim

# stop houdini comp editor from going multi threaded
setenv SESI_THREAD_NOIMG 1

unsetenv NewPath OldLib32Path OldPath

setenv  MORE            '-c'
setenv  PAGER           less

if ( `uname` == "Linux" ) then
  # less -X stops screen from being cleared after exiting
  setenv LESS "-X"
endif

# user dlight extension path
echo "adding user dLight extensions"
if ($?DLIGHT_EXTENSION_PATH) then
        setenv DLIGHT_EXTENSION_PATH ${DLIGHT_EXTENSION_PATH}:${HOME}/dLightExtensions
else
        setenv DLIGHT_EXTENSION_PATH ${HOME}/dLightExtensions
endif

#  add developer's dlight extension path
echo "adding developer dLight extensions"
if ($?DLIGHT_EXTENSION_PATH) then
        setenv DLIGHT_EXTENSION_PATH ${DLIGHT_EXTENSION_PATH}:/jobs2/soft/projects/dlight/devextensions
else
        setenv DLIGHT_EXTENSION_PATH /jobs2/soft/projects/dlight/devextensions
endif


# the SHELL environment variable seems to be set wrong
# in the when switching to csh
switch ($shell:t)
  case *csh:
    # reset it for tcsh or csh
    setenv SHELL $shell
    breaksw
  default:
   unsetenv SHELL
endsw

if ( $?tcsh ) then
# tcsh settings

set watch=(5 any any)		# print who's logged on
set autolist ambiguous		# make <TAB> show everything
set autoexpand			# history complete - like !showtool
set autocorrect			# try to correct spelling mistakes
set filec			# <TAB> does file completion
set rmstar			# warn if 'rm *' is typed
set matchbeep=nomatch		# only beep if there are no completion matches
set nobeep			# turn off audible bell
set correct=cmd			# spellcheck commands only
set symlinks=expand		# some kind of symbolic link handling
set addsuffix			#
set color
set colorcat

# ellipsis makes the omitted directories in prompt appear as '...'
set ellipsis
# custom prompt setting
set prompt="%n@%m:%h:[%c03] % "

# Prompt used when waiting for stuff or 'for' or 'while'...
set prompt2="%R? "

# Prompt used for correcting. <SPACE>: yes <ENTER>: no <e>: edit
set prompt3="CORRECT>%R (y|n|e)? "

set ignoreeof           # Prevents ^D from logging out
set notify              # Notification of job completions
bindkey -e              # Set emacs key bindings
unset autologout        # Disable timed automatic logout

# After a 'Ctrl-Z', it lists all the jobs.
set listjobs


    # completion rules (tcsh only)
    #

    complete man 'n/*/c/'
    complete which 'n/*/c/'
    complete dbx 'p/2/(core)/' 'n/*/c/'
    complete edge 'p/2/(core)/' 'n/*/c/'
    complete set 'p/1/s/'
    complete unset 'p/1/s/'
    complete setenv 'p/1/e/'
    complete unsetenv 'p/1/e/'
    complete complete 'p/1/c/'
    complete cd 'p/1/d/'
    complete pu 'p/1/d/'
    complete pushd 'p/1/d/'
    complete vi 'n/*/f/'
    complete fg 'n/*/j/'
    complete bg 'n/*/j/'
    complete kill 'c/-/`kill -l`/' 
    complete gzip 'c/-/(9)/' 'n/-r/d/' 'n/-9/(-v)/' 'n/*/f/'
    complete gunzip 'n/*/f:*.{gz,z,Z}/'
    complete unzip 'n/*/f:*.{zip,ZIP}/'
    complete bunzip2 'n/*/f:*.{bz2}/'
    complete compress 'n/*/f/'
    complete uncompress 'n/*/f:*.Z/'
    complete unpack 'n/*/f:*.z/'
    complete zcat 'n/*/f:*.{gz,z,Z}/'
    complete tar 'n/-x*f/f:*.tar/' 'c/-x/(vopf)/' 'c/-c/(vf)/' \
                 'n/-c*f/f:*.tar/' 'n/-t*f/f:*.tar/'
    complete gs 'n/*/f:*.ps/'
    complete ghostview 'n/*/f:*.ps/'
    complete xpsview 'n/*/f:*.ps/'
    complete login 'p/1/u/'
    complete im n,\*,'`/bin/ls . | egrep -v \(.z\$\|.Z\$\|.gz\$\)`',
    complete cvs p/1/"(add admin annotate checkout commit diff edit editors export history import init log login rdiff release remove rtag status tag unedit update watch)"/

    complete ptviewer 'n/*/f:*.{ptc,ptc.gz,ptf}/'
    complete brickviewer 'n/*/f:*.{bkm}/'

    # git completion
    complete git p/1/"(add bisect branch checkout clone commit diff fetch grep init log merge mv pull push rebase reset rm show status tag)"/
    #set gitcmds= ( `/bin/ls /usr/bin/git-*|sed 's/\/usr\/bin\/git-//g'` )
    #complete git "p/1/($gitcmds)/" 'n/branch/`git branch|cut -c 3-`/' 'n/co/`git branch|cut -c 3-`/' 'n/remote/(show add rm prune update)/' 'N/remote/`git remote`/'

    # sbworkon - custom disney git wrapper completion
    complete sbworkon n,\*,'`/bin/ls /disney/users/$USER/projects`',

endif

# set disney development related env vars
setenv SANDBOXROOT "/disney/users/$USER/projects/"
setenv PROJECTS "/disney/users/$USER/projects/"
setenv GIG_COLOR_PROMPT 1
setenv GIG_GIT_PROMPT 1

if ( `whoami` == "jmacleod" ) then
# cvs home for personal work
setenv CVSROOT ${HOME}/cvs
endif

# custom Maya env variables
setenv WINEDITOR emacs

# SGI/Linux specific settings
if ( `uname` == "Irix" ) then
   # Irix settings
   # faster key repeat
   keywarp 40 3
else
   # Linux settings	
   # fix terminal on Linux
   stty sane

   setenv DISK1LOCAL /disk1/local
   # teTeX stuff on linux
   setenv TETEXDIR ${DISK1LOCAL}/teTeX
   if ( -d ${TETEXDIR}/bin/i686-pc-linux-gnu ) then
     setenv PATH "${PATH}:${TETEXDIR}/bin/i686-pc-linux-gnu"
   endif
   # postgres stuff
   if ( -d ${DISK1LOCAL} ) then
     setenv PATH "${PATH}:${DISK1LOCAL}/bin"
     setenv PGDATA /disk1/local/pgsql/data/
   endif

endif

# Frozen setup
#source ~/.alias.froz

# Big Hero Six setup
#source ~/.alias.hero

# Tujunga setup
source ~/.alias.tujunga

# Zootopia setup
#source ~/.alias.zoot

# Moana setup
source ~/.alias.waka

# Stereo setup
source ~/.alias.stereo

# rjobs queuing setup
source ~/.alias.rjobs

setenv TMPDIR /disk1/tmp

# attach to home dir for local python libs
echo 'python: attaching to home dir'
attach /home/fahome/jmacleod

else
  # for non-interactive shells
endif
