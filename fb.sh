#!/usr/bin/env bash

# Load environment variables from .env file
eval "$(
    awk -F= '{
        if (!/^\s*#/ && !/^\s*$/) {
            key=$1;
            sub(/^ *| *$/, "", key);
            value=substr($0, index($0,$2));
            sub(/^ *| *$/, "", value);
            print "export " key "=\"" value "\""
        }
    }' .env
)"

# Source the progress bar script
. progress_bar.sh

# Prompt for filename
echo "Please enter your filename:"
read -r filename

# Loop to fetch data from Facebook
for ((n = 1; n <= 100; n++)); do
    # Fetch HTML content
    html=$(curl -sL "https://www.facebook.com/$n" \
        -H "cookie: $FB_COOKIE" \
        -H 'accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.7' \
        -H 'accept-language: en-US,en;q=0.9,ru;q=0.8' \
        -H 'cache-control: max-age=0' \
        -H 'dpr: 2' \
        -H 'priority: u=0, i' \
        -H 'sec-ch-prefers-color-scheme: dark' \
        -H 'sec-ch-ua: "Google Chrome";v="125", "Chromium";v="125", "Not.A/Brand";v="24"' \
        -H 'sec-ch-ua-full-version-list: "Google Chrome";v="125.0.6422.142", "Chromium";v="125.0.6422.142", "Not.A/Brand";v="24.0.0.0"' \
        -H 'sec-ch-ua-mobile: ?0' \
        -H 'sec-ch-ua-model: ""' \
        -H 'sec-ch-ua-platform: "macOS"' \
        -H 'sec-ch-ua-platform-version: "15.0.0"' \
        -H 'sec-fetch-dest: document' \
        -H 'sec-fetch-mode: navigate' \
        -H 'sec-fetch-site: same-origin' \
        -H 'sec-fetch-user: ?1' \
        -H 'upgrade-insecure-requests: 1' \
        -H 'user-agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36' \
        -H 'viewport-width: 1440')

    # Extract headline using awk
    name=$(echo "$html" | sed -n '/"data":{"name":"\([^"]*\)","gender"/s/.*"data":{"name":"\([^"]*\)","gender".*/\1/p')

    # Save extracted headline to summary file
    echo "$n $name" >>"$filename.txt"

    # Update progress bar
    progress_bar $((n))
done

echo "Congratulations on finding what's left of the first 100 FB users!"
