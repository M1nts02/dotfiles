export hsPath="$( cd "$( dirname -- "${BASH_SOURCE[0]}" )" && pwd )"

spoonsPath="${hsPath}/Spoons"
mkdir -p "${spoonsPath}"

# $1:link
# $2:spoonName
addSpoon () {
  if [[ -z "${1}" ]]; then
    return
  fi

  if [[ -z "${2}" ]]; then
    spoonName="${1##*/}"
    spoonName="${spoonName//.git/}"
  else
    spoonName="${2}"
  fi

  mkdir -p "${spoonsPath}/${2}"
  cd "${spoonsPath}/${2}"

  git clone ${1} --depth 1
  git pull
}

addSpoon "https://github.com/mogenson/PaperWM.spoon.git"
