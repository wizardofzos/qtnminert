
# Running this

    docker build -t qtnminert .
    docker-compose up
    [STOP IT AFTER IT RUNS]

Then go and edit config/pool.txt to match your pool info (wallet/pooladdress).

Rebuild the docker (via docker build -t qtnminert .)

and restart




## Might be Important to run on 'host' system...
On host: sysctl -w vm.nr_hugepages=128
