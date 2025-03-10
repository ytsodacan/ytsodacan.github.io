document.querySelectorAll('.draggable').forEach(item => {
    item.addEventListener('dragstart', (e) => {
        e.dataTransfer.setData('type', e.target.getAttribute('data-type'));
    });
});

document.getElementById('canvas').addEventListener('dragover', (e) => {
    e.preventDefault();
});

document.getElementById('canvas').addEventListener('drop', (e) => {
    e.preventDefault();
    const type = e.dataTransfer.getData('type');
    const newItem = document.createElement(type === 'text' ? 'div' : 'img');
    newItem.classList.add('canvas-item');
    newItem.style.left = `${e.clientX - e.target.getBoundingClientRect().left}px`;
    newItem.style.top = `${e.clientY - e.target.getBoundingClientRect().top}px`;
    newItem.draggable = true;
    newItem.addEventListener('dragstart', dragStart);
    newItem.addEventListener('dragend', dragEnd);
    if (type === 'text') {
        newItem.textContent = 'New Text';
        newItem.style.background = 'white';
        newItem.style.padding = '5px';
    } else {
        newItem.src = 'https://via.placeholder.com/100';
        newItem.style.width = '100px';
    }
    document.getElementById('canvas').appendChild(newItem);
});

function dragStart(e) {
    e.dataTransfer.setData('text/plain', '');
    this.style.opacity = '0.5';
    this.dataset.offsetX = e.clientX - this.offsetLeft;
    this.dataset.offsetY = e.clientY - this.offsetTop;
}

function dragEnd(e) {
    this.style.opacity = '1';
    this.style.left = `${e.clientX - this.dataset.offsetX}px`;
    this.style.top = `${e.clientY - this.dataset.offsetY}px`;
}

function saveCanvas() {
    const elements = document.querySelectorAll('.canvas-item');
    let content = '<!DOCTYPE html><html><head><style>.canvas-item{position:absolute;}</style></head><body>';
    elements.forEach(el => {
        const style = `style="left:${el.style.left};top:${el.style.top};"`;
        if (el.tagName === 'DIV') {
            content += `<div class="canvas-item" ${style}>${el.textContent}</div>`;
        } else {
            content += `<img class="canvas-item" ${style} src="${el.src}">`;
        }
    });
    content += '</body></html>';
    const blob = new Blob([content], { type: 'text/html' });
    const a = document.createElement('a');
    a.href = URL.createObjectURL(blob);
    a.download = 'canvas.html';
    a.click();
}