import FroalaEditor from 'froala-editor'
import 'froala-editor/js/languages/zh_tw.js'
import 'froala-editor/js/plugins/table.min.js'
import 'froala-editor/js/plugins/colors.min.js'
import 'froala-editor/js/plugins/draggable.min.js'
import 'froala-editor/js/plugins/font_size.min.js'
import 'froala-editor/js/plugins/fullscreen.min.js'
import 'froala-editor/js/plugins/image.min.js'
import 'froala-editor/js/plugins/link.min.js'
import 'froala-editor/js/plugins/lists.min.js'
import 'froala-editor/js/plugins/quote.min.js'
import 'froala-editor/js/plugins/video.min.js'
import 'froala-editor/js/plugins/word_paste.min.js'

document.addEventListener('DOMContentLoaded', function(event) {
  let editor = new FroalaEditor('#memo_content', {
    language: 'zh_tw', 
    spellcheck: true, 
    imageUploadURL: '/api/upload_image'
  })
})
