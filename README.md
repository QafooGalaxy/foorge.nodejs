Foorge Node.js Role
===================

This node.js role provides a new runtime platform which can run node.js code as
workers or webservers. It can be used as development only platform to help
users with their Grunt, Gulp or Webpack stacks.

This role installs Node.js using the PPA from Chris Lea.

Foorge Platform
---------------

The node.js foorge platform provides a language runtime for Node programs.

Minimal Example
---------------

    ---
    - hosts: app:&development
      roles:
        - role: "foorge.nodejs"
          nodejs_npm_use_temporary: 1 
          nodejs_global_packages: ['grunt-cli', 'webpack', 'webpack-dev-server']
          nodejs_servers:
              - { app: "app1", program: "node index.js" }
              - { app: "assets", program: "webpack-dev-server --port 8091" }

License
-------

MIT
