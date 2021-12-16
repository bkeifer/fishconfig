function _tide_item_aws_account
    if set -q AWS_ACCESS_KEY_ID; and set -q AWS_SECRET_ACCESS_KEY; and set -q AWS_SESSION_TOKEN
        set -l tide_aws_account_info (grep (aws sts get-caller-identity --output json | jq -r .Account) ~/.awsaccounts)
        set -l tide_aws_account_info_id (echo $tide_aws_account_info | awk -F ',' '{print $1}')
        set -l tide_aws_account_info_name (echo $tide_aws_account_info | awk -F ',' '{print $2}')
        set -l tide_aws_account_info_env (echo $tide_aws_account_info | awk -F ',' '{print $3}')
        if test $tide_aws_account_info_env = "PROD"
            set -U tide_aws_account_color white
            set -U tide_aws_account_bg_color red
        else if test $tide_aws_account_info_env = "STAGE"
            set -U tide_aws_account_color black
            set -U tide_aws_account_bg_color yellow
        else if test $tide_aws_account_info_env = "DEV"
            set -U tide_aws_account_color black
            set -U tide_aws_account_bg_color green
        end
        _tide_print_item aws_account ' ' $tide_aws_account_info_name' '$tide_aws_account_info_env
    end
end