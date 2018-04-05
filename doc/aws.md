AWS
===
I use the aws cli, and protect it using a [YubiKey](https://www.yubico.com).

Setup
-----

1. Install the aws cli (`pip install awscli`)
1. Install [ykman](https://github.com/Yubico/yubikey-manager) (`brew install
   ykman`)
1. [Create](https://docs.aws.amazon.com/IAM/latest/UserGuide/id_users_create.html#id_users_create_console)
   a user with programmatic access using the AWS management console.  I called
   my user `pokey-macbook`.
1. Configure the user to have a policy like the following:

    ```js
    {
        "Version": "2012-10-17",
        "Statement": [
            {
                "Effect": "Allow",
                "Action": "*",
                "Resource": "*",
                "Condition": {
                    "NumericLessThan": {
                        "aws:MultiFactorAuthAge": "21600"
                    }
                }
            },
            {
                "Effect": "Allow",
                "Action": [
                    "iam:GetUser",
                    "iam:ListMFADevices"
                ],
                "Resource": "*"
            }
        ]
    }
    ```

   This gives the user full account privileges when the MFA has been activated
   which lasts 6 hours, and otherwise just the ability to get info about itself
   and to list mfa devices.  This policy was based on the one described in the
   [phrase/aws-mfa](https://github.com/phrase/aws-mfa) repo.  You may prefer to
   have a more conservative policy that only allows access to specific
   resources.
1. Start [setting up](https://docs.aws.amazon.com/IAM/latest/UserGuide/id_credentials_mfa_enable_virtual.html)
   the user with a virtual MFA device.  When it shows you the barcode, click on
   "Show secret key for manual configuration" and copy the long string.
1. Run `ykman oath add -t aws-<PROFILE>`, and paste the string when prompted.
   This sets up your YubiKey to behave like a virtual MFA device.
1. Run `ykman oath code -s aws-<PROFILE>` a couple times, waiting as necessary,
   to get codes to enter in to the AWS management console.
1. Run `aws configure --profile <PROFILE>` and paste in the values from the
   console.


Using the cli
-------------

When you need to use the aws cli or the aws api eg via boto3 in a particular
shell, use `awm <PROFILE>`.  It supports tab completion using fzf.  This wraps
the [`awsmfa`](../bin/awsmfa) script to set environment variables that activate
the profile in that specific shell for the next 6 hours.  Note that any command
you type in this shell will have access to these environment variables, so only
run commands you trust.
