# 📞 FAQ & Troubleshooting Guide

## 🔥 PyPI Publication

### Q: How do I set up trusted publishing on PyPI?
**A:** Follow these steps:
1. Go to https://pypi.org/manage/project/lmx/settings/publishing/
2. Click "Add publish target"
3. Fill in:
   - **Owner**: `my-ai-stack`
   - **Repository**: `lmx` (or your repo name)
   - **Environment**: `pypi`
4. Repeat for `ai-rag-system` and `Stack-3.0`
5. Create a GitHub release → PyPI publish triggers automatically

### Q: My PyPI publish failed. What do I do?
**A:** Check:
1. Trusted publishing is set up correctly
2. The `pypi` environment exists in your GitHub repo (Settings → Environments)
3. The release tag matches the version in `pyproject.toml`
4. Check the "Actions" tab for error logs

### Q: How do I verify my package is on PyPI?
**A:** Run:
```bash
pip install lmx
lmx --help
```

---

## 🤗 HuggingFace Spaces

### Q: How do I create a HuggingFace Space?
**A:** Since the API has limitations:
1. Go to https://huggingface.co/spaces
2. Click "Create new Space"
3. Select owner: `my-ai-stack`
4. Name: `ai-rag-system` (same as repo)
5. SDK: Gradio
6. Upload files from the `hf-space/` directory in your repo

### Q: My Space won't start. What's wrong?
**A:** Check:
1. `README.md` has correct YAML frontmatter (sdk, sdk_version)
2. `app.py` exists and is referenced correctly
3. `requirements.txt` lists all dependencies
4. Check the "Logs" tab in your Space

### Q: How do I add API keys to my Space?
**A:** In your Space settings:
1. Go to Settings → Variables and secrets
2. Add new secret: `OPENAI_API_KEY` = `sk-...`
3. The secret is injected as an environment variable

---

## 🌐 Web Deployment (Vercel)

### Q: How do I deploy content-agency-app?
**A:**
```bash
cd content-agency-app
vercel --prod
```
Add environment variable in Vercel dashboard: `GROQ_API_KEY`

### Q: My Vercel deployment failed. Help!
**A:** Check:
1. `package.json` has correct build scripts
2. All environment variables are set
3. The build logs in Vercel dashboard
4. Try: `npm run build` locally to debug

---

## 📢 Marketing & Growth

### Q: Where should I post about my repos?
**A:** Priority subreddits:
- **r/Python**: lmx, ai-code-assistant
- **r/LocalLLaMA**: Stack-3.0, lmx
- **r/LangChain**: ai-rag-system, ai-agent-builder
- **r/MachineLearning**: Stack-3.0, deepfake-detector

### Q: How do I write a good "Show HN" post?
**A:** Format:
```
Show HN: lmx - Smart LLM Model Picker (cut API costs 50%)

I built lmx to automatically pick the cheapest LLM for your task. 
It checks all providers (OpenAI, Anthropic, Groq, etc.) and recommends 
the best model within your budget.

GitHub: https://github.com/my-ai-stack/lmx
PyPI: https://pypi.org/project/lmx/

Would love your feedback!
```

### Q: How long until I reach 1M downloads?
**A:** Based on our plan:
- Week 1: 100 downloads (PyPI published)
- Week 4: 2,500 downloads (Web app launched)
- Week 8: 10,000 downloads (YouTube videos live)
- Week 24: 200,000 downloads (Partnerships)
- Week 52: **1,000,000 downloads** 🎉

---

## 🐛 Common Issues

### Issue: `pip install lmx` fails with "Not found"
**Solution:** PyPI package not published yet. Set up trusted publishing first.

### Issue: GitHub Actions CI fails
**Solution:** Check if API keys are needed for tests. We fixed CI to skip integration tests when keys are missing.

### Issue: HuggingFace Space shows "Build error"
**Solution:** Check:
1. `requirements.txt` doesn't have conflicting dependencies
2. `app.py` has no syntax errors
3. All imported packages are in `requirements.txt`

### Issue: `monitor.sh` doesn't work
**Solution:**
```bash
# Set HF_TOKEN environment variable
export HF_TOKEN="hf_..."
./monitor.sh
```

### Issue: Reddit post gets removed
**Solution:**
1. Don't spam the same post across multiple subreddits
2. Wait 24 hours between posts
3. Engage with comments (reply to each one)
4. Don't use URL shorteners

---

## 📊 Tracking Progress

### Q: How do I track my downloads?
**A:** Run the monitoring script:
```bash
chmod +x monitor.sh
./monitor.sh
```

Or check manually:
- PyPI: https://pypistats.org/packages/lmx
- HuggingFace: Check model cards for download counts
- GitHub: `gh repo list my-ai-stack --json name,stargazerCount`

### Q: My downloads are low. What should I do?
**A:** 
1. **Content**: Create YouTube tutorials (highest ROI)
2. **SEO**: Optimize landing pages for keywords
3. **Partnerships**: Partner with influencers in AI space
4. **Product Hunt**: Launch your web app

---

## 🆘 Emergency Contacts

- **GitHub Issues**: https://github.com/my-ai-stack/.github/issues
- **HuggingFace**: https://huggingface.co/my-ai-stack
- **Website**: https://www.stack-ai.me

---

## 💡 Pro Tips

1. **Be consistent**: Post to Reddit/YouTube weekly
2. **Engage**: Reply to EVERY comment on your posts
3. **Build in public**: Tweet daily progress updates
4. **Collaborate**: Partner with other AI projects
5. **Iterate**: Double down on what works, fix what doesn't

---

**Still need help?** Create an issue in the `.github` repo with your question! 🚀
