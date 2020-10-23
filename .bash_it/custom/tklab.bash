dgx() {
    local port="$1"
    # get rid of the first argument
    shift 1
    if [[ $port =~ ^[0-9]{5}$ ]]; then
        echo "Open tunnel to DGX port $port"
        ssh -NfL $port:127.0.0.1:$port bengallusser@dgx1
    elif [[ $port =~ ^http:\/\/127\.0\.0\.1:([0-9]{5}).+$ ]]; then
        # Regex group capturing from https://stackoverflow.com/questions/1891797/capturing-groups-from-a-grep-regex
        local port_regexed="${BASH_REMATCH[1]}"
        echo "Open tunnel to DGX port $port_regexed"
        ssh -NfL $port_regexed:127.0.0.1:$port_regexed bengallusser@dgx1
    else
        echo "Did not find a valid tunnel in the input"
    fi
}
