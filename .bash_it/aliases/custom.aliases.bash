alias count='ls -1 | wc -l'

dgx() {
    local port="$1"
    # get rid of the first argument
    shift 1
    ssh -NfL $port:127.0.0.1:$port bengallusser@dgx1
}
