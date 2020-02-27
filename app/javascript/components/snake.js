let snake = [ {x:200, y:200}, {x:180, y:200}, {x:160, y:200}, {x:140, y:200}, {x:120, y:200} ];
let foodX = 0;
let foodY = 0;
let score = 0;

let gameCanvas = document.getElementById("gameCanvas");
let ctx = gameCanvas.getContext("2d");
ctx.font = "30px Arial";
const backgroundColor = "rgba(99,99,99,0.6)";
const snakeSize = 20;
let dx = snakeSize;
let dy = 0;


const drawBackground = () => {
  // Canvas Setup
  ctx.fillStyle = backgroundColor;
  ctx.fillRect(0, 0, gameCanvas.width, gameCanvas.height);
}

const drawSnakePart = (snakePart) => {
  ctx.fillStyle = '#e61e6e';
  ctx.strokeStyle = '#999';
  ctx.fillRect(snakePart.x, snakePart.y, snakeSize, snakeSize);
  ctx.strokeRect(snakePart.x, snakePart.y, snakeSize, snakeSize);
}

const drawSnake = () => {
  snake.forEach(drawSnakePart);
}

const changeDirection = ((event) => {
  const LEFT_KEY = 'KeyA';
  const RIGHT_KEY = 'KeyD';
  const UP_KEY = 'KeyW';
  const DOWN_KEY = 'KeyS';
  const keyPressed = event.code;
  const goingUp = dy === -snakeSize;
  const goingDown = dy === snakeSize;
  const goingRight = dx === snakeSize;
  const goingLeft = dx === -snakeSize;
  if (keyPressed === LEFT_KEY && !goingRight) {
    dx = -snakeSize;
    dy = 0;
  }  if (keyPressed === UP_KEY && !goingDown) {
    dx = 0;
    dy = -snakeSize;
  }  if (keyPressed === RIGHT_KEY && !goingLeft) {
    dx = snakeSize;
    dy = 0;
  }  if (keyPressed === DOWN_KEY && !goingDown) {
    dx = 0;
    dy = snakeSize;
  }
});

const drawFood = () => {
  ctx.fillStyle = 'white';
  ctx.fillRect(foodX, foodY, snakeSize, snakeSize);
}

const setFood = () => {
  foodX = Math.floor(Math.random() * (400 / snakeSize - 2)) * snakeSize + snakeSize;
  foodY = Math.floor(Math.random() * (400 / snakeSize - 2)) * snakeSize + snakeSize;
}

const snakeEatFood = () => {
  return snake[0].x == foodX && snake[0].y == foodY
}

const moveSnake = () => {
  let snakeHeadX = snake[0].x + dx;
  let snakeHeadY = snake[0].y + dy;
  snake.unshift({x:snakeHeadX, y:snakeHeadY});
  if (snakeEatFood()) {
    setFood();
    score += 1;
  } else {
    snake.pop();
  }
}

const snakeDead = () => {
  if (snake[0].x >= 400 || snake[0].x < 0 || snake[0].y >= 400 || snake[0].y < 0) {
    gameOver();
    clearInterval(game);
  }
  snake.slice(1).forEach((part) => {
    if (snake[0].x == part.x && snake[0].y == part.y) {
      gameOver();
      clearInterval(game);
    }
  })
}

const allowSubmit = () => {
  if (score >= 3) {
    const signup = document.querySelector('.signup-button-disabled');
    if (signup) {
      signup.classList.add('signup-button');
      signup.classList.remove('signup-button-disabled');
      signup.disabled = false;
    }
    gameCanvas.style = 'display: none;';
    document.getElementById('captcha-image').style = 'display: flex;';
    document.querySelector('.fa-check').classList.add('checked');
  }
}

const update = () => {
  drawBackground();
  drawSnake();
  snakeDead();
  drawFood();
  allowSubmit();
  ctx.fillText(`${score} / 3`, 10, 40);
  moveSnake();
}

const gameOver = () => {
  ctx.font = "40px Arial";
  ctx.fillText('Game Over', 100, 200);
}

const snakeGame = () => {
  const captcha = document.getElementById('captcha-image')
  captcha.addEventListener('click', () => {
    captcha.style = 'display: none;'
    drawBackground();
    document.addEventListener("keydown", changeDirection);
    setFood();
    ctx.font = "30px Arial";
    ctx.fillStyle = 'white';
    ctx.fillText('Score 3 Points to sign up', 30, 40);
    ctx.fillText('Use A, S, D, and W to move', 15, 140);
    ctx.fillText('Press Space to start', 70, 260);
    document.addEventListener("keydown", (e) => {
      if (e.code == 'Space') {
        let game = setInterval(() => {
            update()
          }, 200);
      }
    });
  })
}

export { snakeGame };
