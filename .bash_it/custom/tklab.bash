dgx() {
    local port="$1"
    local username="bengallusser"
    local machine="dgx1"
    # get rid of the first argument
    shift 1
    if [[ $port =~ ^[0-9]{5}$ ]]; then
        echo "Open tunnel to $machine port $port"
        ssh -NfL $port:127.0.0.1:$port ${username}@${machine}
    elif [[ $port =~ ^http:\/\/127\.0\.0\.1:([0-9]{5}).+$ ]]; then
        # Regex group capturing from https://stackoverflow.com/questions/1891797/capturing-groups-from-a-grep-regex
        local port_regexed="${BASH_REMATCH[1]}"
        echo "Open tunnel to $machine port $port_regexed"
        ssh -NfL $port_regexed:127.0.0.1:$port_regexed ${username}@${machine}
    else
        echo "Did not find a valid tunnel in the input"
    fi
}

# Disable hdf5 file locking
export HDF5_USE_FILE_LOCKING=FALSE
