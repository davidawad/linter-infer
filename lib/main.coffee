helpers = null

module.exports =
  config:
    inferExecutablePath:
      type: 'string'
      title: 'fbinfer executable path'
      default: 'infer' # Let OS's $PATH handle the rest

    ignoreErrorCodes:
      type: 'array'
      default: []
      description: 'ignore errors from infer NOT SUPPORTED YET'  # 'TODO support removing error codes from fbinfer output'

  activate: ->
    require('atom-package-deps').install('linter-infer')

  provideLinter: ->
    provider =
      name: 'infer'
      grammarScopes: ['source.java', 'source.c'] # TODO add support for obj-c
      scope: 'file'        # or 'project'
      lintOnFly: true      # must be false for scope: 'project'

      lint: (textEditor)->
        helpers ?= require('atom-linter')
        command = @inferExecutablePath
        return Promise.resolve([]) unless command?

        filePath = textEditor.getPath()
        console.log(filePath)

        parameters = []
        parameters.push(' -- ')

        # compile based on filetype
        fType = filePath.substring(filePath.length-4)

        if ftype is 'java'
            # we're looking at a java file
            parameters.push('javac')

        if ftype.substring(ftype.length-1) is 'c'
            # we're looking at a C file
            parameters.push('gcc')
            parameters.push('-c')

        else
          console.log('Error! Unrecognized filepath:')
          console.log(filePath)
          return Promise.resolve([])

        return helpers.exec(command, parameters).then(output) ->
          messages = []
          for i in [0...output - 1] by 1
            if 'error' in ouput[i]
                # we found an error, report in editor


