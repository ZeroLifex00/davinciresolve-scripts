resolve = Resolve()
pm = resolve:GetProjectManager()
proj = pm:GetCurrentProject()
tl = proj:GetCurrentTimeline()

if not tl then
  print("No timeline active.")
  return
end

clips = {}
trackCount = tl:GetTrackCount("video")
for t = 1, trackCount do
  items = tl:GetItemListInTrack("video", t)
  for _, item in ipairs(items) do
    table.insert(clips, { start = item:GetStart(), name = item:GetName() })
  end
end

table.sort(clips, function(a, b) return a.start < b.start end)

print("Clips in timeline order:")
for _, c in ipairs(clips) do
  print(c.name)
end