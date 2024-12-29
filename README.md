# rrr_2024

[![](https://img.shields.io/badge/React-18.3.1-orange.svg)](https://reactjs.org) [![](https://img.shields.io/badge/parcel-2.12.0-royalblue.svg)](https://parceljs.org/) [![](https://img.shields.io/badge/Node.js-16.17.0-yellowgreen.svg)](https://nodejs.org/en/) [![](https://img.shields.io/badge/Ruby-3.3.3-red.svg)](https://www.ruby-lang.org/en/) [![](https://img.shields.io/badge/Rails-7.1.3.4-red.svg)](https://rubyonrails.org/) [![](https://img.shields.io/badge/Docker-blue.svg)](https://www.docker.com/) [![](https://img.shields.io/badge/Postgres-16.2-lightblue.svg)](https://hub.docker.com/_/postgres)

## Local Setup

I use Ruby on both Mac and on **Windows 11** (currently build `22631.3737` as of **6.24.2024**). 

I performed the following to uprade my local Windows Ruby installation (from `3.1.2p20` and `Rails 7.0.3.1`) to the versions specified above:

1. **Note:** I install some development tools on my local drive `C:` but do most work on another drive. Make sure to hunt down the correct drive and `C:\Users` directory!
2. I performed a clean install of `Ruby 3.3.3.1` using the recommended [Windows installer](https://www.ruby-lang.org/en/downloads/) (which differs quite a bit from `brew` based installations). (Thankfully, the **Ruby Installer** has all `make` dependencies rolled into it vastly simplifying its setup!)
3. Make sure to wipe the directories `C:\msys64` by manually removing the directory (if it lingers) using the **Settings > Apps > Installed apps** Uninstaller. (If it still persists use a force delete like [CCleaner](https://www.ccleaner.com/) and carefully purge the **Windows Registery** using the **Registery Cleaner**!) 
4. That'll allow you to cleanly install `MSYS2` again (I ran into issues after installing `ruby` with `rails`). I used settings `1,2,3` and all succeeded after wiping any lingering dependencies per the above.
5. `ruby --version` then `gem update` lastly `gem install rails`. Those should all succeed as expected.
6. I noticed that Rails doesn't populate the correct `bindir` and will complain. It'll say something like: `/c/Users/adami/AppData/Local/Microsoft/WindowsApps/rails: line 6:`. Surprisingly, this occurred after updating my **System > Environment Variable** `Path`
   * The `rails` file was found here: `C:\Users\<MY_USER>\AppData\Local\Microsoft\WindowsApps`
   * The `ruby` install was here: `C:\Ruby33-x64`
7. I fixed this using the absolute drive path (per the above) on line `6`:
    ```plaintext
    =begin
    bindir="/C/Ruby33-x64/bin"
    exec "$bindir/ruby" "-x" "$0" "$@"
    =end
    ```
    That way `rails` can be called and executed on drive `G:`
8. I was then able to confirm `rails --version`:

    ```bash
    $ rails --version
    Rails 7.1.3.4
    ```
    and initialize the contents of [/rails//web](/rails//web) with the correctly updated version:

    ```bash
    rails new web
    # from within the /rails directory within this repo
    ```
## Use

```bash
docker-compose up

# If using: Docker Compose Engine V2
docker compose up 
```

1. http://localhost:1234
2. http://localhost:3000/rails/info/routes
3. [API Endpoints](test_curl.sh)

## Notes

1. May need to also perform the above with `bundle` locally on **Windows 11**.
2. The default database in `postgres`.
3. http://localhost:3000/ will display the Rails default app page.
4. Run `rails new project` after an initial commit has been created in the parent directory - it'll cause commit issues otherwise since `rails` initializes a `.git` history.

## Resources and Links

1. https://blog.eq8.eu/til/ruby-logs-and-puts-not-shown-in-docker-container-logs.html
2. https://www.rubyguides.com/2019/04/rails-render/
3. https://www.stackhawk.com/blog/rails-cors-guide/
4. https://www.codegram.com/blog/routing-in-rails/
5. https://guides.rubyonrails.org/routing.html
