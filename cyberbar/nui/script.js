windows.addEventListener('message', (event) => {
    if (event.data.type === 'open') {
        open('./main.html', _self)
    }
})