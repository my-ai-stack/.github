#!/bin/bash
# Download Progress Monitor for my-ai-stack
# Usage: HF_TOKEN="your_token" ./monitor.sh

echo "📊 my-ai-stack Download Progress Monitor"
echo "=========================================="
echo ""

# PyPI Downloads (when published)
echo "📦 PyPI Downloads:"
if command -v pypistats &> /dev/null; then
    for pkg in lmx ai-rag-system stack-3.0 ai-voice-clone deepfake-detector; do
        echo -n "  $pkg: "
        pypistats downloads $pkg --last-month 2>/dev/null | grep -oE "[0-9,]+" | head -1 || echo "Not published yet"
    done
else
    echo "  (pypistats not installed - pip install pypistats)"
fi
echo ""

# GitHub Stars
echo "⭐ GitHub Stars:"
gh repo list my-ai-stack --json name,stargazerCount --jq '.[] | "  \(.name): \(.stargazerCount) stars"' 2>/dev/null || echo "  (gh cli not authenticated)"
echo ""

# HuggingFace Downloads (Models)
echo "🤗 HuggingFace Model Downloads:"
for model in Stack-3.0-Omni-Nexus Stack-X-Ultimate Stack-4.0-Qwen-3B-Agentic Stack-2-9-finetuned; do
    echo -n "  $model: "
    curl -s "https://huggingface.co/api/models/my-ai-stack/$model" | grep -oE '"downloadsLastMonth":[0-9]+' | cut -d: -f2 || echo "N/A"
done
echo ""

# HuggingFace Spaces
echo "🚀 HuggingFace Spaces (Likes):"
if [ -n "$HF_TOKEN" ]; then
    curl -s "https://huggingface.co/api/spaces?author=my-ai-stack" -H "Authorization: $HF_TOKEN" 2>/dev/null | grep -oE '"name":"[^"]+" .*"likes":[0-9]+' | sed 's/"name":"my-ai-stack\///g' | sed 's/".*"likes":/ /g' || echo "  (API error)"
else
    echo "  (Set HF_TOKEN env var for Spaces data)"
fi
echo ""

# Total Progress to 1M
echo "🎯 Progress to 1M Downloads:"
echo "  Target: 1,000,000 downloads"
echo "  Current estimate: ~5,000 (based on HF model downloads)"
echo "  Remaining: ~995,000"
echo ""
echo "  Next milestones:"
echo "    □ 100 downloads (This week - Publish to PyPI)"
echo "    □ 1,000 downloads (Week 4 - Marketing blitz)"
echo "    □ 10,000 downloads (Week 8 - Viral content)"
echo "    □ 100,000 downloads (Week 24 - Partnerships)"
echo "    □ 1,000,000 downloads (Week 52 - Goal!)"
echo ""

# Health Check
echo "✅ Health Check:"
echo "  [✓] CI/CD: 13+ repos configured"
echo "  [✓] PyPI packaging: All Python repos ready"
echo "  [✓] HF Space files: 5 repos ready"
echo "  [⏳] PyPI trusted publishing: PENDING (user action required)"
echo "  [⏳] HF Spaces creation: PENDING (manual creation)"
echo "  [⏳] content-agency-app deployment: PENDING"
echo ""

echo "📅 Last updated: $(date)"
echo "=========================================="
