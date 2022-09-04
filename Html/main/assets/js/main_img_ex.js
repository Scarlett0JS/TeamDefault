const character = document.querySelector('.character');

let degree = 0;
loop();

function loop() {

    const rotation = (degree * Math.PI) / 180;
    const targetX = window.innerWidth / 2 + 80 * Math.cos(rotation) - 10;
    const targetY = window.innerHeight / 2 + 80 * Math.sin(rotation) - 10;

    character.style.left = `${targetX}px`;
    character.style.top = `${targetY}px`;

    degree += 1;

    requestAnimationFrame(loop);
}