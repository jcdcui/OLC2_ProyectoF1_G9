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
    }
    .text-red-500 {
      color: red;
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
  