<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Interpay Sample Project</title>
    <link rel="stylesheet" href="/Interpay/assets/css/main.css">
    <style>

    </style>
</head>
<body>
<div class="container">
    <div class="search-form">
        <form action="search">
            <input type="text" class="form-control" name="searchme" onkeyup="sendSearch()" placeholder="Author Search">
        </form>
    </div>
    <div class="search-result" id="result"></div>
</div>
<script>
    function sendSearch() {
        let keyword = document.querySelector('input[name=searchme]').value
        let data = {keyword: keyword}
        const xhr = new XMLHttpRequest();
        xhr.open("POST", "?p=author/search");
        xhr.setRequestHeader("Accept", "application/json");
        xhr.setRequestHeader("Content-Type", "application/json");
        xhr.send(JSON.stringify(data));
        xhr.onreadystatechange = function () {
            if (this.readyState === 4) {
                if (this.status === 200) {
                    let authors = JSON.parse(this.responseText)
                    let element = document.getElementById('result')
                    let result = ''
                    if(keyword !== '') {
                        authors.forEach((item, index) => {
                            result += '<div class="author-grid" id="book-'+item.book_id+'"><div>' + item.author_name + '</div>'
                            if(item.book_name === null)
                                result += '<div>No books found</div>'
                            else
                                result += '<div>' + item.book_name + '</div>'
                            result += '</div>'
                        })
                    }
                    element.innerHTML = result
                }
            }
        }
    }
</script>
</body>
</html>
