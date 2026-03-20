# 式神召喚術 ── Shikigami

> 陰陽師以符咒驅使式神；開發者以 prompt 驅動 agent。

**Shikigami** 是一個 Claude Code Skill，讓你透過對話自動生成高品質的 agent prompt。無論是單一任務的獨立 agent，還是多 agent 協作的複雜工作流，只要描述你的需求，式神召喚術就能幫你產出可直接使用的 prompt。

## 功能

- 根據需求自動選擇合適的 prompt 模板
- 支援 CLAUDE.md、inline prompt、multi-agent 陣法三種輸出格式
- 內建 6 種式神模板與 5 種協作陣法
- 可附加 self-check、progress reporting、thinking 觸發等增強模組

## 式神類型

| 式神 | 類型 | 適用場景 |
|------|------|---------|
| 獨行式神 | Solo Agent | 單一任務，從頭到尾獨立完成 |
| 前鋒式神 | Scout Agent | 資訊收集、搜尋、研究 |
| 鍛造式神 | Builder Agent | 程式碼生成、檔案建立 |
| 審判式神 | Reviewer Agent | 審查、測試、品質把關 |
| 統帥式神 | Orchestrator Agent | 分派任務、協調多個 sub-agent |
| 守護式神 | Guardian Agent | 監控、安全檢查、邊界防護 |

## 陣法模式

| 陣法 | 模式 | 適用場景 |
|------|------|---------|
| 串流陣 | Pipeline | 任務有明確的先後順序 |
| 散射陣 | Fan-out / Fan-in | 同一任務可拆分為多個獨立子任務 |
| 輪轉陣 | Iterative Refinement | 需要反覆改進直到達到品質標準 |
| 看門陣 | Gatekeeper | 處理前後需要安全/品質檢查 |
| 專家會議陣 | Expert Panel | 需要從多個角度評估同一個問題 |

## 安裝

將 `shikigami.skill` 加入 Claude Code 的 skill 目錄：

```bash
cp shikigami.skill ~/.claude/skills/
```

或將專案檔案放入你的工作目錄，Claude Code 即可自動偵測並載入。

## 使用方式

在 Claude Code 對話中，用自然語言描述你的需求即可觸發：

```
幫我召喚一隻式神，專門做 code review
```

```
我需要一個 multi-agent 工作流，先爬資料、再清洗、最後匯入資料庫
```

```
幫我寫一個 agent prompt，讓 Claude Code 自動把 JS 專案轉成 TypeScript
```

也可以直接使用 skill 指令：

```
/shikigami
```

## 專案結構

```
├── SKILL.md           # Skill 主定義：召喚流程、寫作原則、輸出格式
├── templates.md       # 6 種式神契約模板
├── formations.md      # 5 種多式神協作陣法
├── shikigami.skill    # 打包後的 skill 檔案
└── README.md
```

## 設計原則

- **祈使句優先**：「讀取檔案」而非「你應該讀取檔案」
- **具體勝於抽象**：「在 /src 下找到所有 .py 檔」而非「找到相關檔案」
- **邊界比能力重要**：明確說「不要修改 /config」比「小心處理設定檔」有效
- **範例是最好的說明**：附上 input/output 範例
- **Prompt 長度控制在 300–800 tokens**：太短缺乏指引，太長式神會迷路

## License

MIT
