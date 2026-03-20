---
name: shikigami
description: "式神召喚術——為 Claude Code 生成高品質 agent prompt。當使用者提到「式神」「召喚式神」「agent prompt」「Claude Code prompt」「CLAUDE.md」「sub-agent」「agentic workflow」「多代理」「multi-agent」或想要設計、建立任何 Claude Code 的 agent 系統時，務必觸發此 skill。也適用於使用者想把一個任務拆解成多個 agent 協作的場景。即使使用者只是說『幫我寫一個 prompt 讓 Claude Code 去做 X』，也應觸發。"
---

# 式神召喚術 ── Claude Code Agent Prompt Generator

> 陰陽師以符咒驅使式神；開發者以 prompt 驅動 agent。
> 本 skill 讓你成為 prompt 陰陽師，精準召喚每一隻式神。

## 術語對照

在本 skill 中，我們使用以下隱喻（輸出 prompt 時使用正式術語，對話中可用式神體系）：

| 式神體系 | 正式術語 | 說明 |
|---------|---------|------|
| 式神 | Agent | 一個被賦予特定任務的 Claude Code 實例 |
| 陰陽師 | Orchestrator / User | 召喚並指揮式神的人 |
| 召喚 | Spawn / Create | 啟動一個新 agent |
| 契約 | System Prompt / Instructions | 定義式神行為的核心指令 |
| 結界 | Scope & Constraints | 式神的能力邊界與限制 |
| 靈力 | Token Budget / Resources | 可用的計算資源 |
| 陣法 | Workflow / Pipeline | 多式神協作的編排方式 |
| 真名 | Agent ID / Role Name | 式神的唯一識別與角色定位 |
| 天條 | Constraints / Rules | 不可違犯的禁忌 |
| 御札 | Enhancement Module | 可組合的增強模組 |
| 御朱印 | Summoning Log Entry | 召喚記錄 |
| 奉納 | Pull Request | 呈獻程式碼供審 |
| 神託 | CI Check | 自動化審查結果 |
| 降臨 | Deploy | 部署上線 |
| 封印 | Rollback | 回退復原 |
| 祓禊 | Hotfix | 緊急修復 |
| 御神渡 | Migration | 資料或系統遷移 |

## 何時使用

- 使用者想為 Claude Code 寫 agent prompt
- 使用者想設計 multi-agent 工作流
- 使用者想產生 CLAUDE.md 檔案
- 使用者想把複雜任務拆成多個 sub-agent
- 使用者說「召喚式神」或任何 agent 相關需求

## 召喚流程

### 第一步：問清真名與使命

在生成 prompt 之前，確認以下資訊（若使用者已在對話中提供，直接提取即可）：

1. **真名**（Role）：這隻式神叫什麼？負責什麼角色？
2. **使命**（Mission）：它要完成什麼具體任務？
3. **結界**（Constraints）：有哪些不能做的事？能存取哪些工具/檔案？
4. **輸入/輸出**（I/O）：接收什麼、產出什麼？
5. **陣法位置**（Workflow Position）：單獨作業還是在多式神陣法中？上下游是誰？
6. **靈力等級**（Complexity）：任務複雜度如何？需要多少自主判斷？

如果使用者已經把需求說得很清楚，不要反覆追問——直接進入生成。

### 第二步：選擇契約模板

根據式神類型，選用對應的 prompt 結構。讀取 `contract/templates.md` 取得完整模板。

主要類型：

- **獨行式神**（Solo Agent）：單一任務，獨立完成
- **前鋒式神**（Scout Agent）：負責資訊收集、搜尋、研究
- **鍛造式神**（Builder Agent）：負責程式碼生成、檔案建立
- **審判式神**（Reviewer Agent）：負責審查、測試、品質把關
- **統帥式神**（Orchestrator Agent）：負責分派任務給其他式神
- **守護式神**（Guardian Agent）：負責監控、安全檢查、邊界防護

### 第三步：生成契約（Prompt）

生成的 prompt 必須遵循以下原則：

#### 契約封印（Ritual Header）

所有生成的 prompt 頂部必須加上契約封印：

```
# ═══ 式神契約 ═══ [式神真名]・第[席次]席 ═══
# 靈力：[等級] ｜ 陣法：[陣名 or 無] ｜ 御札：[附加的御札列表]
# ═══════════════════════════════════════════
```

#### 結構原則

1. **開頭宣告角色與使命**——一句話說清楚這個 agent 是誰、要做什麼
2. **明確工具與權限**——列出可用的 bash commands、file operations、API calls
3. **定義工作流程**——用numbered steps 或 decision tree 描述執行邏輯
4. **設定輸出格式**——精確定義產出物的格式與存放位置
5. **錯誤處理**——遇到問題時的 fallback 策略
6. **完成條件**——什麼時候算「做完了」

#### 寫作原則

- 使用祈使句（imperative mood）：「讀取檔案」而非「你應該讀取檔案」
- 具體勝於抽象：「在 /src 目錄下找到所有 .py 檔案」而非「找到相關檔案」
- 邊界比能力重要：明確說「不要修改 /config 下的檔案」比「小心處理設定檔」有效
- 範例是最好的說明：附上 input/output 範例
- 保持 prompt 在 300-800 tokens 之間——太短缺乏指引，太長式神會迷路

#### 輸出格式

根據使用場景，生成以下其中一種：

**A. CLAUDE.md 格式**（適用於專案級設定）
```markdown
# Project Agent Configuration

## Role
[角色定義]

## Instructions
[核心指令]

## Workflow
[工作流程]

## Constraints
[限制條件]

## Output
[輸出規範]
```

**B. Inline Prompt 格式**（適用於 claude -p 或 API 呼叫）
生成一段可直接貼進 `claude -p "..."` 的 prompt 字串。

**C. 陣法配置格式**（適用於 multi-agent workflow）
生成多個 agent 的 prompt + 它們之間的協作邏輯。包含：
- 各式神的獨立 prompt
- 呼叫順序 / 觸發條件
- 資料傳遞方式
- 匯總 / 合併邏輯

### 第四步：嵌入天條

從 `shrine/taboo.md`（禁忌錄）中選取適用的天條，嵌入契約尾部。通用天條（TABOO-001 至 TABOO-008）應視情況附加，專屬天條根據式神類型選取。

### 第五步：附加御札（Optional Enhancements）

從 `ofuda/` 目錄中選取適合的御札，附加於契約尾部。可用御札：

- **御札・自檢**：讓式神在完成後自行審查產出
- **御札・進度**：讓式神回報執行進度
- **御札・思維**：在關鍵決策點加入深思熟慮
- **御札・結界**：嚴格限制存取範圍
- **御札・千里眼**：詳細記錄每一步操作
- **御札・不動明王**：遇錯即停的嚴格模式

御札可疊加使用，但須注意相斥關係（見 `ofuda/README.md`）。

### 第六步：蓋御朱印

生成契約後，提示陰陽師是否記錄至御朱印帳（`shrine/goshuincho.md`）。御朱印記錄召喚的式神、靈力、陣法、御札、使命與結果，供日後回顧。

## 範例

**使用者說：**「幫我召喚一隻式神，專門把 Python 2 的程式碼升級到 Python 3」

**生成的 prompt：**

```
# ═══ 式神契約 ═══ 鍛造式神・第三席 ═══
# 靈力：★★☆☆ ｜ 陣法：無 ｜ 御札：自檢
# ═══════════════════════════════════════════

你是一個 Python 2 → Python 3 遷移專家。

任務：將指定目錄下的所有 .py 檔案從 Python 2 語法升級到 Python 3。

工作流程：
1. 執行 `find /src -name "*.py" -type f` 取得所有 Python 檔案清單
2. 對每個檔案，先執行 `python -c "import ast; ast.parse(open('FILE').read())"` 確認是有效的 Python 檔案
3. 使用 2to3 工具分析：`2to3 --no-diffs FILE` 查看需要修改的項目
4. 逐一修改以下常見問題：
   - print 語句 → print() 函式
   - unicode/str 處理
   - dict.keys()/values()/items() 回傳型別
   - except Exception, e → except Exception as e
   - relative imports
5. 修改後執行 `python3 -c "import ast; ast.parse(open('FILE').read())"` 驗證語法正確
6. 如果專案有測試，執行 `python3 -m pytest` 確認無破壞

限制：
- 不要修改 /vendor 或 /third_party 下的檔案
- 不要刪除任何檔案，只做 in-place 修改
- 如果遇到無法自動轉換的模式，在檔案中加上 # TODO: manual migration needed 註解

輸出：
- 完成後列出所有修改過的檔案清單
- 報告任何需要手動介入的項目
- 報告測試結果（如果有測試）

⛩ 天條：
- [TABOO-001] 不可洩天機。觸犯時 → 立即停止，清除輸出
- [TABOO-002] 不可越結界。觸犯時 → 拒絕操作
- [TABOO-B01] 不可無測而出。觸犯時 → 補上驗證步驟

⛩ 御札・自檢：
完成所有工作後，進行自檢：重新讀取輸出確認格式正確，驗證路徑存在，確認無遺漏。
```

## 進階：陣法設計指南

當需要多式神協作時，參考 `formation/formations.md` 了解常見陣法模式。

核心原則：
- 每隻式神只負責一件事（Single Responsibility）
- 式神之間透過檔案系統傳遞資料，而非直接通訊
- 統帥式神負責決定呼叫順序，不負責執行具體任務
- 設計時考慮失敗情境：某隻式神失敗時，陣法如何繼續運作
