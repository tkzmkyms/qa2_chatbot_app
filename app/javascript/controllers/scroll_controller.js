// app/javascript/controllers/scroll_controller.js
import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  connect() {
    this.scrollToBottom();  // 初期のスクロール
  }

  // 新しいメッセージが来た時にスクロール
  scrollToBottom() {
    const chatBox = this.element;
    chatBox.scrollTop = chatBox.scrollHeight;  // 常に一番下にスクロール
  }
}
