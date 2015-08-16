# komodo-website
The official Komodo IDE and Komodo Edit website

# Running it

You need Ruby 1.9 or above. 

```
bundle install
export KO_QA="true"
export GITHUB_ID="username"
export GITHUB_SECRET="password"
middleman resources
middleman server
```

You only need to run `middleman resources` when you want to pull in the latest resources/packages. 

The export stuff for GITHUB is to authenticate with the API, and only necessary if you intend to run `middleman resources`

When running `middleman server` you can access the site from `http://dev.komodoide.com:4567`
