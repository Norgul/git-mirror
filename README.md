# Git mirror
This is a short script for mirroring a set of repositories
to a different location together with all branches tags and
commit history.

For example:

```
https://github.com/user/repo1.git ==> https://github.com/new_location/clone1.git
https://github.com/user/repo2.git ==> https://github.com/new_location/clone2.git
https://github.com/user/repo3.git ==> https://github.com/new_location/clone3.git
```

# Usage
Download the repository `git clone https://github.com/Norgul/git-mirror.git`
and then enter the repository `cd git-mirror`.

**Note:** running any of commands will create a new `git-mirror`
folder at your home directory which will hold bare repositories.
Once cloned, they won't be re-downloaded, just updated on each
command run.

## Single repository transfer
Simply run `./git-mirror.sh PRIMARY SECONDARY` where `PRIMARY`
is the ful URL to original, main repository. `SECONDARY` is 
the clone repository which will be overwritten with data from
`PRIMARY` repo.

## Multiple repository transfer
In order to mirror multiple repositories, you need to fill out
the repos.txt file with a pair of space separated repositories, 
each pair in new line. Repositories should be full URL to the
repository.

For example:

```
https://...repo1.git https://...clone1.git
https://...repo2.git https://...clone2.git
https://...repo3.git https://...clone3.git
```

Once the file is full, simply run `./repo-mirror.sh`, and rest
will be done automatically.

# Continuous mirroring
You can continuously mirror your set of repositories (or just a 
single one) by setting up a cron job which will run the script
periodically.

For that to work without user prompt you will need to set passwordless 
ssh access. 

First generate SSH key with no password with `ssh-keygen -t rsa -C "mail@somewhere.com"` 
and hit enter twice when it asks for password without entering anything. 

After that go and enter SSH key to both of your repos and copy the `.pub` from key.

Once that is done you need to add a `config` file in `.ssh` folder:

```
# ~/.ssh/config
Host *hostname*
    Hostname *hostname*
    User git
    IdentityFile ~/.ssh/*your passwordless ssh key (id_rsa if you used default)*
```

Test the config by doing:

```
git clone git@your.hostname.com:username/reponame.git
```

If this is successful, you should be okay. 

**Note** If you are using 2 different hosts, you will have to make 2 entries in 
SSH config file.


