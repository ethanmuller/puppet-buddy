function setup() {
  // Prevent scrolling on mobile
  Hammer(document).on("drag", function(e) {
    e.gesture.preventDefault();
  });

  var skinColors = [
    {
      skin: [98, 55, 55],
      eyes: [37, 15, 15],
      lips: [184, 97, 97],
      mouth: [74, 21, 21]
    },
    {
      skin: [245, 205, 208],
      eyes: [71, 63, 58],
      lips: [237, 134, 148],
      mouth: [187, 90, 101]
    }
  ];

  window.skin = skinColors[Math.floor(Math.random()*skinColors.length)];

  createCanvas(windowWidth, windowHeight);
}

function draw() {
  var xPoint = touchX || mouseX,
      yPoint = touchY || mouseY;

  background(skin.skin);

  var unit = 15;

  strokeWeight(unit);

  stroke(skin.lips);
  fill(skin.mouth);

  var xMiddle = width / 2;
  var xFromMiddle = xMiddle > xPoint ? (xMiddle - xPoint) : (xPoint - xMiddle);

  var yMiddle = height / 2;
  var yFromMiddle = yMiddle > yPoint ? (yMiddle - yPoint) : (yPoint - yMiddle);

  var mouthRadius = function() {
    var minMouthWidth = unit * 4;
    return xFromMiddle < minMouthWidth ? minMouthWidth / 2 : xFromMiddle / 2;
  };

  rectMode(CENTER);
  rect(xMiddle, yMiddle, mouthRadius(), yFromMiddle);

  // draw eyeballz
  noStroke();
  fill(skin.eyes);

  var drawEye = function(side) {
    var xAxis;

    if (side === 'left') {
      xAxis = xMiddle - mouthRadius() / 2;
    } else if (side == 'right') {
      xAxis = xMiddle + mouthRadius() / 2;
    }

    function eyeHeight() {
      if (
        xPoint / width < 0.1 ||
        xPoint / width > 0.9 ||
        yPoint / height < 0.1 ||
        yPoint / height > 0.9
      ) {
        return (unit / 2);
      } else {
        return unit;
      }
    }

    rect(
      xAxis,
      yMiddle - (yFromMiddle / 2) - (unit * 2),
      unit,
      eyeHeight()
    );
  };

  drawEye('left');
  drawEye('right');
}
