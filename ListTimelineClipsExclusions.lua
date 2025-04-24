resolve = Resolve()
pm = resolve:GetProjectManager()
proj = pm:GetCurrentProject()
tl = proj:GetCurrentTimeline()

if not tl then
  print("No timeline active.")
  return
end

-- Define clip names to exclude
-- Example if excluding more than one
-- ["Clip1.mp4"] = true,
-- ["Clip2.mp4"] = true
local excluded = {
  ["RDP - Countdown.mp4"] = true
}

clips = {}
trackCount = tl:GetTrackCount("video")
for t = 1, trackCount do
  items = tl:GetItemListInTrack("video", t)
  for _, item in ipairs(items) do
    local name = item:GetName()
    if not excluded[name] then
      table.insert(clips, { start = item:GetStart(), name = name })
    end
  end
end

table.sort(clips, function(a, b) return a.start < b.start end)

print("Clips in timeline order (excluding specified names):")
for _, c in ipairs(clips) do
  print(c.name)
end