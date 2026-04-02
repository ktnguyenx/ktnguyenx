import AppKit
import Foundation

struct BubbleConfig {
	let text: String
	let x: Double
	let y: Double
	let leftPadding: Double
	let rightPadding: Double
	let fill: String
	let textClass: String
	let tailSymbol: String?
	let tailX: Double
	let tailY: Double
	let tailWidth: Double
	let tailHeight: Double
}

let title = "Animated iMessage-style README conversation for Lorraine Nguyen"
let desc = "A minimal conversation with a typing indicator and three iMessage-inspired bubbles that animate in from alternating sides."

let font = NSFont.systemFont(ofSize: 22, weight: .medium)
let attrs: [NSAttributedString.Key: Any] = [.font: font]

func measure(_ text: String) -> Double {
	Double((text as NSString).size(withAttributes: attrs).width)
}

func bubbleWidth(text: String, leftPadding: Double, rightPadding: Double) -> Double {
	ceil(measure(text) + leftPadding + rightPadding)
}

let leftBubble1 = BubbleConfig(
	text: "Hi, I'm Lorraine!",
	x: 88,
	y: 34,
	leftPadding: 26,
	rightPadding: 26,
	fill: "#E9E9EB",
	textClass: "dark",
	tailSymbol: "curl-left",
	tailX: -3,
	tailY: 30,
	tailWidth: 19,
	tailHeight: 20
)

let blueText = "CS Undergrad @ Haverford"
let blueWidth = bubbleWidth(text: blueText, leftPadding: 24, rightPadding: 24)
let blueX = 888.0 - blueWidth
let blueBubble = BubbleConfig(
	text: blueText,
	x: blueX,
	y: 110,
	leftPadding: 24,
	rightPadding: 24,
	fill: "#509DF6",
	textClass: "light",
	tailSymbol: "curl-right",
	tailX: blueWidth - 16,
	tailY: 30,
	tailWidth: 19,
	tailHeight: 20
)

let leftBubble3 = BubbleConfig(
	text: "I love creative programming and designing thoughtful interfaces <3",
	x: 88,
	y: 220,
	leftPadding: 26,
	rightPadding: 26,
	fill: "#E9E9EB",
	textClass: "dark",
	tailSymbol: "curl-left",
	tailX: -3,
	tailY: 30,
	tailWidth: 19,
	tailHeight: 20
)

let bubble1Width = bubbleWidth(
	text: leftBubble1.text,
	leftPadding: leftBubble1.leftPadding,
	rightPadding: leftBubble1.rightPadding
)
let bubble3Width = bubbleWidth(
	text: leftBubble3.text,
	leftPadding: leftBubble3.leftPadding,
	rightPadding: leftBubble3.rightPadding
)

let svg = """
<svg width="960" height="320" viewBox="0 0 960 320" fill="none" xmlns="http://www.w3.org/2000/svg" role="img" aria-labelledby="title desc">
  <title id="title">\(title)</title>
  <desc id="desc">\(desc)</desc>
  <style>
    text {
      font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", sans-serif;
      font-size: 22px;
      font-weight: 500;
    }

    .dark {
      fill: #111111;
    }

    .light {
      fill: #ffffff;
    }

    .status {
      fill: #7d7d82;
      font-size: 16px;
      font-weight: 500;
    }

    .typing,
    .bubble,
    .status-mark {
      opacity: 0;
      transform-box: fill-box;
      transform-origin: center bottom;
    }

    .left {
      transform: translateY(12px) scale(0.985);
    }

    .right {
      transform: translateY(12px) scale(0.985);
    }

    #typing {
      animation: typing-cycle 12s infinite;
    }

    #typing-dot-1 {
      animation: dot-blink 1s infinite 0.1s;
    }

    #typing-dot-2 {
      animation: dot-blink 1s infinite 0.28s;
    }

    #typing-dot-3 {
      animation: dot-blink 1s infinite 0.46s;
    }

    #bubble-1 {
      animation: left-bubble-1 12s infinite;
    }

    #bubble-2 {
      animation: right-bubble-2 12s infinite;
    }

    #bubble-3 {
      animation: left-bubble-3 12s infinite;
    }

    #status-2 {
      animation: status-2-cycle 12s infinite;
    }

    @keyframes typing-cycle {
      0%, 5% {
        opacity: 0;
        transform: translateY(12px) scale(0.985);
      }

      8%, 18% {
        opacity: 1;
        transform: translateY(0) scale(1);
      }

      22%, 100% {
        opacity: 0;
        transform: translateY(8px) scale(0.99);
      }
    }

    @keyframes left-bubble-1 {
      0%, 18% {
        opacity: 0;
        transform: translateY(12px) scale(0.985);
      }

      24%, 90% {
        opacity: 1;
        transform: translateY(0) scale(1);
      }

      100% {
        opacity: 0;
        transform: translateY(8px) scale(0.99);
      }
    }

    @keyframes right-bubble-2 {
      0%, 34% {
        opacity: 0;
        transform: translateY(12px) scale(0.985);
      }

      40%, 90% {
        opacity: 1;
        transform: translateY(0) scale(1);
      }

      100% {
        opacity: 0;
        transform: translateY(8px) scale(0.99);
      }
    }

    @keyframes left-bubble-3 {
      0%, 58% {
        opacity: 0;
        transform: translateY(12px) scale(0.985);
      }

      64%, 90% {
        opacity: 1;
        transform: translateY(0) scale(1);
      }

      100% {
        opacity: 0;
        transform: translateY(8px) scale(0.99);
      }
    }

    @keyframes status-2-cycle {
      0%, 46% {
        opacity: 0;
        transform: translateY(6px) scale(0.88);
      }

      52% {
        opacity: 1;
        transform: translateY(0) scale(1.05);
      }

      58%, 90% {
        opacity: 1;
        transform: translateY(0) scale(1);
      }

      100% {
        opacity: 0;
        transform: translateY(4px) scale(0.95);
      }
    }

    @keyframes dot-blink {
      0%, 80%, 100% {
        opacity: 0.25;
      }

      40% {
        opacity: 1;
      }
    }
  </style>

  <defs>
    <symbol id="curl-right" viewBox="0 0 17 21">
      <path d="M16.8869 20.1846C11.6869 20.9846 6.55352 18.1212 4.88685 16.2879C6.60472 12.1914 -4.00107 2.24186 2.99893 2.24148C4.61754 2.24148 6 -1.9986 11.8869 1.1846C11.9081 2.47144 11.8869 6.92582 11.8869 7.6842C11.8869 18.1842 17.8869 19.5813 16.8869 20.1846Z"/>
    </symbol>
    <symbol id="curl-left" viewBox="0 0 17 21">
      <path d="M0.11315 20.1846C5.31315 20.9846 10.4465 18.1212 12.1132 16.2879C10.3953 12.1914 21.0011 2.24186 14.0011 2.24148C12.3825 2.24148 11 -1.9986 5.11315 1.1846C5.09194 2.47144 5.11315 6.92582 5.11315 7.6842C5.11315 18.1842 -0.88685 19.5813 0.11315 20.1846Z"/>
    </symbol>
  </defs>

  <g transform="translate(88 34)">
    <g id="typing" class="typing left">
      <rect x="0" y="0" width="92" height="42" rx="21" fill="#E9E9EB"/>
      <use href="#curl-left" x="-3" y="22" width="16" height="17" fill="#E9E9EB"/>
      <circle id="typing-dot-1" cx="29" cy="21" r="4.5" fill="#7D7D82"/>
      <circle id="typing-dot-2" cx="46" cy="21" r="4.5" fill="#7D7D82"/>
      <circle id="typing-dot-3" cx="63" cy="21" r="4.5" fill="#7D7D82"/>
    </g>
  </g>

  <g transform="translate(\(Int(leftBubble1.x)) \(Int(leftBubble1.y)))">
    <g id="bubble-1" class="bubble left">
      <rect x="0" y="0" width="\(Int(bubble1Width))" height="50" rx="25" fill="\(leftBubble1.fill)"/>
      <use href="#\(leftBubble1.tailSymbol!)" x="\(Int(leftBubble1.tailX))" y="\(Int(leftBubble1.tailY))" width="\(Int(leftBubble1.tailWidth))" height="\(Int(leftBubble1.tailHeight))" fill="\(leftBubble1.fill)"/>
      <text x="\(Int(leftBubble1.leftPadding))" y="32" class="\(leftBubble1.textClass)">\(leftBubble1.text)</text>
    </g>
  </g>

  <g transform="translate(\(Int(blueBubble.x)) \(Int(blueBubble.y)))">
    <g id="bubble-2" class="bubble right">
      <rect x="0" y="0" width="\(Int(blueWidth))" height="50" rx="25" fill="\(blueBubble.fill)"/>
      <use href="#\(blueBubble.tailSymbol!)" x="\(Int(blueBubble.tailX))" y="\(Int(blueBubble.tailY))" width="\(Int(blueBubble.tailWidth))" height="\(Int(blueBubble.tailHeight))" fill="\(blueBubble.fill)"/>
      <text x="\(Int(blueBubble.leftPadding))" y="32" class="\(blueBubble.textClass)">\(blueBubble.text)</text>
    </g>
  </g>

  <g transform="translate(\(Int(blueBubble.x)) \(Int(blueBubble.y)))">
    <g id="status-2" class="status-mark right">
      <text x="\(Int(blueWidth - 24))" y="70" text-anchor="end" class="status">Delivered</text>
    </g>
  </g>

  <g transform="translate(\(Int(leftBubble3.x)) \(Int(leftBubble3.y)))">
    <g id="bubble-3" class="bubble left">
      <rect x="0" y="0" width="\(Int(bubble3Width))" height="50" rx="25" fill="\(leftBubble3.fill)"/>
      <use href="#\(leftBubble3.tailSymbol!)" x="\(Int(leftBubble3.tailX))" y="\(Int(leftBubble3.tailY))" width="\(Int(leftBubble3.tailWidth))" height="\(Int(leftBubble3.tailHeight))" fill="\(leftBubble3.fill)"/>
      <text x="\(Int(leftBubble3.leftPadding))" y="32" class="\(leftBubble3.textClass)">I love creative programming and designing thoughtful interfaces &lt;3</text>
    </g>
  </g>
</svg>
"""

let outputURL = URL(fileURLWithPath: "assets/readme-chat.svg")
try svg.write(to: outputURL, atomically: true, encoding: .utf8)
print("Wrote \(outputURL.path)")
