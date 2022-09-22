usage() {
    echo "Usage: $0 [-s] [-m] [-u] <#tp> <#exo>"
    echo "-s \t If set, the script will use stdin as input (instead of the default input file)"
    echo "-m \t If set, the script will use lex and main file (instead of just lex file)"
    echo "-u \t If set, the script will use utils.c file (incorect without -m)"
}
exit_abnormal() {
  usage
  exit 1
}

USE_STDIN=0
USE_MULTIPLE=0
USE_UTILS=0

if [ $# -lt 2 ]; then
    exit_abnormal
fi

while getopts "smu" options; do
  case "${options}" in           
    s)                                   
      USE_STDIN=1
      ;;
    m)                                   
      USE_MULTIPLE=1
      ;;
    u)                                   
      USE_UTILS=1
    ;;
    :)
      echo "Error: -${OPTARG} requires an argument."
      exit_abnormal
      ;;
    *)                            
      exit_abnormal
      ;;
  esac
done

if [ $USE_MULTIPLE -eq 0 ] && [ $USE_UTILS -eq 1 ]; then
  echo "Error: -u requires -m"
  exit_abnormal
fi

TP=${@:$OPTIND:1}
EXO=${@:$OPTIND+1:1}

OUT_PATH=./out

rm -f $OUT_PATH/*
cp ./src/tp$TP/ex$EXO/* $OUT_PATH

FILE=$OUT_PATH/rules
MAIN=$OUT_PATH/main
INPUT=$OUT_PATH/text
UTILS=$OUT_PATH/utils

if [ $USE_MULTIPLE = 1 ]; then          #USE_MULTIPLE = 0 Fichier lex et main    


    if [ $USE_UTILS = 1 ]; then         #USE_UTILS = 0 Fichier utils
      gcc -c $UTILS.c -o $UTILS.o
    fi
    gcc -c $MAIN.c -o $MAIN.o
    flex -o $FILE.c $FILE.l
    gcc -c $FILE.c -o $FILE.o

    if [ $USE_UTILS = 1 ]; then         #USE_UTILS = 0 Fichier utils
      gcc $MAIN.o $UTILS.o $FILE.o -o $FILE
    else
      gcc $MAIN.o $FILE.o -o $FILE
    fi


else                                    #USE_MULTIPLE = 0 Fichier lex seulement
    flex -o $FILE.c $FILE.l
    gcc $FILE.c -o $FILE
fi

if [ $USE_STDIN = 0 ]; then              # USE_STDIN = 0 : Entrée via fichier
    $FILE $INPUT.in
else                                      # USE_STDIN = 1 : Entrée via stdin
    $FILE < $INPUT.in
fi
exit 0