request = new XMLHttpRequest();
cancelUpload = () ->
    request.abort()

handleUpload = (evt) ->
    evt.preventDefault()
    evt.stopPropagation()

    fileInput = document.getElementById 'file'

    data = new FormData()
    data.append 'file', fileInput.files[0]

    request.upload.addEventListener 'progress', (evt) ->
        if evt.lengthComputable
            percent = evt.loaded / evt.total
            progress = document.getElementById 'upload_progress'

            while progress.hasChildNodes()
                progress.removeChild progress.firstChild

            progress.appendChild(document.createTextNode(Math.round(percent * 100) + ' %'))
        

    request.upload.addEventListener 'load', (evt) ->
        document.getElementById('upload_progress').style.display = 'none'

    request.upload.addEventListener 'error', (evt) ->
        alert 'Upload Failed'

    request.open 'POST', 'index.php'
    request.setRequestHeader 'Cache-Control', 'no-cache'

    document.getElementById('upload_progress').style.display = 'block'

    request.send data

window.addEventListener 'load', (evt) ->
    submit = document.getElementById 'submit'
    cancel = document.getElementById 'cancel'
    submit.addEventListener 'click', handleUpload
    cancel.addEventListener 'click', cancelUpload