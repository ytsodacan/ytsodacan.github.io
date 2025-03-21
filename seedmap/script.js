let map = L.map('map').setView([0, 0], 3); // Default position
L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png').addTo(map);

async function generateMap() {
    let seed = document.getElementById('seedInput').value;
    if (!seed) {
        alert("Enter a valid seed!");
        return;
    }

    const cubios = new CubiOS();
    cubios.setSeed(parseInt(seed));
    
    const structures = [
        { name: "Village", find: cubios.findVillages },
        { name: "Desert Temple", find: cubios.findTemples },
        { name: "Mansion", find: cubios.findMansions }
    ];
    
    map.eachLayer(layer => {
        if (layer instanceof L.Marker) {
            map.removeLayer(layer);
        }
    });

    structures.forEach(structure => {
        let locations = structure.find();
        locations.forEach(location => {
            L.marker([location.z, location.x])
                .addTo(map)
                .bindPopup(`${structure.name} at ${location.x}, ${location.z}`);
        });
    });
}