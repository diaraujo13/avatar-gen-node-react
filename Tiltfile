docker_build('avatar-gen-api',
             context='.',
             # (Optional) Use a custom Dockerfile path
             dockerfile='./deploy/api.dockerfile',
             # (Optional) Filter the paths used in the build
             only=['./api'],
             # (Recommended) Updating a running container in-place
             # https://docs.tilt.dev/live_update_reference.html
             live_update=[
                # Sync files from host to container
                sync('./api', '/app/'),
                # Execute commands inside the container when certain
                # paths change
                run('npm install && npm start', trigger=['./app/'])
             ]
)



k8s_yaml(['k8s/deployment.yaml', 'k8s/service.yaml'])


 k8s_resource('api-backend',
#              # map one or more local ports to ports on your Pod
              port_forwards=['5000:3001'],
#              # change whether the resource is started by default
#              auto_init=False,
#              # control whether the resource automatically updates
#              trigger_mode=TRIGGER_MODE_MANUAL
 )


# Run local commands
#   Local commands can be helpful for one-time tasks like installing
#   project prerequisites. They can also manage long-lived processes
#   for non-containerized services or dependencies.
#
#   More info: https://docs.tilt.dev/local_resource.html
#
# local_resource('install-helm',
#                cmd='which helm > /dev/null || brew install helm',
#                # `cmd_bat`, when present, is used instead of `cmd` on Windows.
#                cmd_bat=[
#                    'powershell.exe',
#                    '-Noninteractive',
#                    '-Command',
#                    '& {if (!(Get-Command helm -ErrorAction SilentlyContinue)) {scoop install helm}}'
#                ]
# )


load('ext://git_resource', 'git_checkout')

