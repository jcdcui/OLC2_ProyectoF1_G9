<script lang="ts">
    import { EditorView } from '@codemirror/view';
    import CodeMirror from 'svelte-codemirror-editor';
    import parseInput from '$lib/parser';
  
    let editorText = "";
    let result = "";
  
    
    let myTheme = EditorView.theme({
      "&": {
        color: "white",
        backgroundColor: "#034",
        fontSize: "14px",
        fontFamily: "monospace",
      },
      ".cm-content": {
        caretColor: "#0e9"
      },
      "&.cm-focused .cm-cursor": {
        borderLeftColor: "#0e9"
      },
      "&.cm-focused .cm-selectionBackground, ::selection": {
        backgroundColor: "#074"
      },
      ".cm-gutters": {
        backgroundColor: "#045",
        color: "#ddd",
        border: "none"
      },
      ".cm-line": {
        padding: "0 4px",
        lineHeight: "1.6"
      }
    }, { dark: true });
  
    const extensions = [
      myTheme
    ];
  
    function parse() {
      result = parseInput(editorText.trim());
    }
  </script>
  
  <style>
    .editor-container {
      padding: 1.25rem;
      display: flex;
      flex-direction: row;
      height: 100%;
      max-height: 100%;
    }
    .editor-box {
      height: 100%;
      width: 50%;
      margin-left: 0.5rem;
      margin-right: 0.5rem;
      border-radius: 0.375rem;
      border: 1px solid black;
      overflow-y: scroll;
    }
    .editor-result {
      border-radius: 0.375rem;
      border: 2px solid black;
      height: 100%;
      width: 50%;
      margin-left: 0.5rem;
      margin-right: 0.5rem;
      transition: all 0.3s ease-in-out;
      background-color: #d1e7dd !important;
      color: #0f5132 !important;
    }

    .text-red-500 {
      background: #67B26F;  /* fallback for old browsers */
      background: -webkit-linear-gradient(to right, #4ca2cd, #67B26F);  /* Chrome 10-25, Safari 5.1-6 */
      background: linear-gradient(to right, #4ca2cd, #67B26F); /* W3C, IE 10+/ Edge, Firefox 16+, Chrome 26+, Opera 12+, Safari 7+ */

    }


  </style>
  
  <div class="editor-container">
    <div class="editor-box">
      <CodeMirror bind:value={editorText} on:change={parse} extensions={extensions} />
    </div>
    <div class="editor-result">
      <p class="text-red-500">
        {result}
      </p>
    </div>
  </div>
  