ENVFILE=config.env

if [ -r ${ENVFILE} ]; then
  echo Sourcing ${ENVFILE}...
  source ${ENVFILE} && \
  export $( sed -n '/^#/!s/=.*//p' ${ENVFILE} )
fi