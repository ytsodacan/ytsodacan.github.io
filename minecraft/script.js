document.addEventListener('DOMContentLoaded', () => {
    // Map buttons to GUI IDs
    const buttonToGui = {
        'Singleplayer': 'singleplayer-gui',
        'Multiplayer': 'multiplayer-gui',
        'qweqew': 'options-gui',
        'wqeqwe': 'language-gui',
        // Add mappings for other buttons...
    };

    // Open GUI when button clicked
    document.querySelectorAll('.mc-button').forEach(button => {
        button.addEventListener('click', () => {
            const title = button.querySelector('.title').textContent.trim();
            const guiId = buttonToGui[title];
            if (guiId) {
                document.getElementById(guiId).classList.remove('hidden');
            }
        });
    });

    // Close GUI when close button clicked
    document.querySelectorAll('.close-btn').forEach(btn => {
        btn.addEventListener('click', () => {
            btn.closest('.gui-overlay').classList.add('hidden');
        });
    });
});
    const archmcserverIP = 'mc.arch.lol'; // Replace with your server IP or domain
    const statusDiv = document.getElementById('archmcstatus');

    async function checkarch() {
      try {
        const response = await fetch(`https://api.mcsrvstat.us/2/mc.arch.lol`);
        const data = await response.json();

        if (data.online) {
          statusDiv.textContent = 'Online';
          statusDiv.className = 'online';
        } else {
          statusDiv.textContent = 'Offline';
          statusDiv.className = 'offline';
        }
      } catch (error) {
        statusDiv.textContent = 'Offline';
        statusDiv.className = 'offline';
      }
    }



    const bgm = document.getElementById('bgm');

    function unmuteAudio() {
      bgm.muted = false;
      bgm.play(); // some browsers need this after unmuting
    }
    
    checkarch(); // Initial check
    setInterval(checkarch, 5000); // Every 5 seconds