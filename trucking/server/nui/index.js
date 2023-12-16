document.addEventListener("DOMContentLoaded", () => {
    document.getElementById('truckingStart').addEventListener('click', () => {
        axios.post(`https://${GetParentResourceName()}/trucking`, {
            trucking: true,
        }).then((response) => {
            console.log(JSON.stringify(response.data))
         });
        });
})