const disneyland = Vue.createApp({
    created() {
        fetch('http://localhost:8888/disneyland-api/public/characters')
        .then(res => res.json())
        .then(data => {
            console.log(data);
            this.charactersData = data;
        })
        .catch(error => {
            console.log(error);
            //let the user know in app, something is going wrong
        })
    },
    data() {
        return {

        
            charactersData: [],
            characterName: "",
            characterId: null,
            description: "",
            // thumbnail: "",
            // numberOfPages: "",
            error: false,
            films: "", // Cambiado a un array vacío
            videoGames: "", // Cambiado a un array vacío
            parkAttractions: "", // Cambiado a un array vacío
            enemies: "", // Cambiado a un array vacío
        }
    },
    methods: {
        getCharacter(whichCharacter) {
            console.log(whichCharacter.id);
            let name = whichCharacter.id;
            fetch(`https://api.disneyapi.dev/character/${name}`)
            .then(res => res.json())
                .then(data => {
                    console.log(data);

                    if (data) {
                        this.error = false;
                        this.films = data.data.films.length > 0 ? data.data.films : ['Not'];
                        this.videoGames = data.data.videoGames.length > 0 ? data.data.videoGames : ['Not available'];
                        this.parkAttractions = data.data.parkAttractions.length > 0 ? data.data.parkAttractions : ['Not available'];
                        this.enemies = data.data.enemies.length > 0 ? data.data.enemies : ['Not available'];
                    } else {
                        this.error = 'There is no information for this character. Please try again later.';
                    }
                })
                .catch(error => {
                    console.error('There was a problem with the fetch operation:', error);
                    this.error = 'There was a problem fetching data. Please try again later.';
                });
        }
    }
    
});
disneyland.mount("#app");