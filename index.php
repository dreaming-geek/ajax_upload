<?php

if (!empty($_FILES['file'])) {
    if($_FILES['file']['error'] == 0 && move_uploaded_file($_FILES['file']['tmp_name'], "files/{$_FILES['file']['name']}"))
    {
        $uploaded = $_FILES['file']['name'];
    }
}

?>
<html>
<head>
    <title>Upload Test</title>
</head>
<body>

<div id="uploaded">
    
    <?php
        // Idea for preview
        if(!empty($uploaded))
        {
            echo '<a href="files/'. $uploaded .'">Preview</a>';    
        }
        
    ?>

</div>
<div id="upload_progress"></div>

<div class="form">
    <form action="" method="post" enctype="multipart/form-data">
        <div>
            <input type="file" name="file" id="file">
            <input type="submit" value="Upload" id="submit">
            <button id='cancel'>Cancel Upload</button>
        </div>
    </form>
</div>

<script src="js/upload.js"></script>
</body>
</html>