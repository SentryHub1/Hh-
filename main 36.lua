local lp=game.Players.LocalPlayer
local ts=game:GetService("TweenService")
local pg=lp:WaitForChild("PlayerGui")

if pg:FindFirstChild("AutoKeyGUI") then
    pg.AutoKeyGUI:Destroy()
end

local ui=Instance.new("ScreenGui")
ui.Name="AutoKeyGUI"
ui.ResetOnSpawn=false
ui.Parent=pg

local function cr(o,r)
    local c=Instance.new("UICorner")
    c.CornerRadius=r or UDim.new(0,10)
    c.Parent=o
end

local function hv(b)
    local bc=b.BackgroundColor3
    b.MouseEnter:Connect(function()
        b.BackgroundColor3=bc:Lerp(Color3.fromRGB(135,135,135),0.25)
    end)
    b.MouseLeave:Connect(function()
        b.BackgroundColor3=bc
    end)
end

local kf=Instance.new("Frame")
kf.Size=UDim2.new(0,350,0,250)
kf.Position=UDim2.new(0.5,-175,-1,0)
kf.BackgroundColor3=Color3.fromRGB(41,41,41)
kf.Parent=ui
cr(kf)

ts:Create(kf,TweenInfo.new(0.6,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),{
    Position=UDim2.new(0.5,-175,0.5,-125)
}):Play()

local box=Instance.new("TextBox")
box.Size=UDim2.new(0,250,0,40)
box.Position=UDim2.new(0.5,-125,0,20)
box.Text=""
box.PlaceholderText="Enter key"
box.TextScaled=true
box.ClearTextOnFocus=false
box.BackgroundColor3=Color3.fromRGB(63,63,63)
box.TextColor3=Color3.new(1,1,1)
box.Parent=kf
cr(box)

local verify=Instance.new("TextButton")
verify.Size=UDim2.new(0,120,0,40)
verify.Position=UDim2.new(0.5,-60,0,70)
verify.Text="Verify"
verify.TextScaled=true
verify.BackgroundColor3=Color3.fromRGB(74,74,74)
verify.TextColor3=Color3.new(1,1,1)
verify.Parent=kf
cr(verify)
hv(verify)

local get=Instance.new("TextButton")
get.Size=UDim2.new(0,120,0,35)
get.Position=UDim2.new(0.5,-60,0,120)
get.Text="Get Key"
get.TextScaled=true
get.BackgroundColor3=Color3.fromRGB(86,86,86)
get.TextColor3=Color3.new(1,1,1)
get.Parent=kf
cr(get)
hv(get)

local d1=Instance.new("TextButton")
d1.Size=UDim2.new(0,200,0,40)
d1.Position=UDim2.new(0.5,-100,0,165)
d1.Text="Join Discord"
d1.TextScaled=true
d1.BackgroundColor3=Color3.fromRGB(59,119,239)
d1.TextColor3=Color3.new(1,1,1)
d1.Parent=kf
cr(d1)
hv(d1)

local st=Instance.new("TextLabel")
st.Size=UDim2.new(1,-20,0,25)
st.Position=UDim2.new(0,10,0,210)
st.BackgroundTransparency=1
st.Text=""
st.TextScaled=true
st.TextColor3=Color3.fromRGB(255,200,0)
st.Parent=kf

local mf=Instance.new("Frame")
mf.Size=UDim2.new(0,400,0,250)
mf.Position=UDim2.new(0.5,-200,-1,0)
mf.BackgroundColor3=Color3.fromRGB(30,30,30)
mf.BackgroundTransparency=1
mf.Parent=ui
cr(mf)

local tl=Instance.new("TextLabel")
tl.Size=UDim2.new(1,-20,0,50)
tl.Position=UDim2.new(0,10,0,10)
tl.BackgroundTransparency=1
tl.Text="Sentry Script Loader"
tl.TextScaled=true
tl.TextColor3=Color3.new(1,1,1)
tl.Parent=mf

local mst=Instance.new("TextLabel")
mst.Size=UDim2.new(1,-20,0,30)
mst.Position=UDim2.new(0,10,0,130)
mst.BackgroundTransparency=1
mst.Text=""
mst.TextScaled=true
mst.TextColor3=Color3.fromRGB(255,200,0)
mst.Parent=mf

local d2=Instance.new("TextButton")
d2.Size=UDim2.new(0,200,0,40)
d2.Position=UDim2.new(0.5,-100,0,120)
d2.Text="Join Discord"
d2.TextScaled=true
d2.BackgroundColor3=Color3.fromRGB(59,119,239)
d2.TextColor3=Color3.new(1,1,1)
d2.Parent=mf
cr(d2)
hv(d2)

local load=Instance.new("TextButton")
load.Size=UDim2.new(0,200,0,40)
load.Position=UDim2.new(0.5,-100,0,180)
load.Text="Load Script"
load.TextScaled=true
load.BackgroundColor3=Color3.fromRGB(74,74,74)
load.TextColor3=Color3.new(1,1,1)
load.Parent=mf
cr(load)
hv(load)

local show=ts:Create(mf,TweenInfo.new(0.6,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),{
    Position=UDim2.new(0.5,-200,0.5,-125),
    BackgroundTransparency=0
})

verify.MouseButton1Click:Connect(function()
    if string.upper(box.Text)=="SENTRY" then
        st.Text="Key verified"
        ts:Create(kf,TweenInfo.new(0.15),{
            Position=kf.Position+UDim2.new(0,0,-0.02,0)
        }):Play()
        task.wait(0.35)
        kf.Visible=false
        show:Play()
    else
        st.Text="Wrong key"
    end
end)

get.MouseButton1Click:Connect(function()
    if setclipboard then
        setclipboard("https://rekonise.com/sentryhub-get-key-kehty")
        st.Text="Copied"
    else
        st.Text="Clipboard not supported"
    end
end)

d1.MouseButton1Click:Connect(function()
    if setclipboard then
        setclipboard("https://discord.gg/X2WBMt2pS")
        st.Text="Copied"
    else
        st.Text="Clipboard not supported"
    end
end)

d2.MouseButton1Click:Connect(function()
    if setclipboard then
        setclipboard("https://discord.gg/X2WBMt2pS")
        mst.Text="Copied"
    else
        mst.Text="Clipboard not supported"
    end
end)

load.MouseButton1Click:Connect(function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/braydencoriano3-cmyk/NFL-universe-football-script/refs/heads/main/main.lua"))()
    mf.Visible=false
end)