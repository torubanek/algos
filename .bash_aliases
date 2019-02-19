### A few convenient aliases (v 1.0.09.20.2018) 
export gh='https://github.com'
export lab='https://github.com/BitSails'

setup()
{
if [ "$#" -gt 0 ]
then
   printf "\033[34mSetting up user.name & user.email for \033[33m $1\n\033[0m"
  git config --global user.name $1 && git config --global user.email $1@users.noreply.github.com


  if [ "$#" -eq 3 ]
   then
     printf "\033[36mForking https://github.com/$3/$2 to $1 \n\033[0m"
      curl -u $1 -X POST https://api.github.com/repos/"$3"/"$2"/forks
  fi
  if [ "$#" -gt 1 ]
   then
     printf "\033[35mCloning https://github.com/$1/$2 \n\033[0m"
      git clone https://github.com/"$1"/"$2"
      cd "$2"
  fi
fi

}



dump()
{
if [ "$#" -eq 1 ] ;then
  hexdump -ve '/1 "%x " ' "$1"
 echo
else
 printf "\e[0;91mERROR:\e[0m usage:  dump \e[1;34mfilename\e[0m\n\n"
fi
}


gi() # a "cheap" way to put git aliases in bash_aliases
{
if [ "$#" -gt 0 ] ;then

  if [ "$1" = "co" ] ;then
   shift # "consume" first arg
   git checkout "$@"
  fi

  if [ "$1" = "br" ] ;then
   shift # "consume" first arg
   git branch "$@"
  fi

  if [ "$1" = "ci" ] ;then
   shift # "consume" first arg
   git commit "$@"
  fi


  if [ "$1" = "cm" ] ;then
   shift # "consume" first arg
   git commit -m "$@"
  fi


  if [ "$1" = "st" ] ;then
   shift # "consume" first arg
   git status "$@"
  fi


  if [ "$1" = "lg" ] ;then
   git log --pretty="format:%ad %C(bold blue)%h%Creset %C(green)(%an)%Creset %C(dim yellow)\"%s\"" --date=short
  fi

 if [ "$1" = "acm" ]  && [ "$#" -eq 2 ] ;then
   echo acm 
   shift # "consume" first arg
   git add .
   git commit -m "$@"
  fi

  if [ "$1" = "acmp" ]  && [ "$#" -eq 2 ] ;then
   echo acm 
   shift # "consume" first arg
   git add .
   git commit -m "$@"
   git push origin master
  fi

else
 printf "\e[0;91mERROR:\e[0m usage:  gi \e[1;34malias\e[0m args\n\n"
 printf "\e[0;91m where alias = \e[1;34mco|br|ci|cm|st|lg|acm:\e[0m\n\n"
fi
}

alias gt='gi'   
alias g='gi'

