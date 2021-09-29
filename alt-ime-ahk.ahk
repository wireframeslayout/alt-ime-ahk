; 左右 Alt キーの空打ちで IME の OFF/ON を切り替える
;
; 左 Alt キーの空打ちで IME を「英数」に切り替え
; 右 Alt キーの空打ちで IME を「かな」に切り替え
; Alt キーを押している間に他のキーを打つと通常の Alt キーとして動作
;
; Author:     karakaram   http://www.karakaram.com/alt-ime-on-off

#UseHook
#SingleInstance, force

; これがないと正しくLWin & Spaceが動かなかった
SendMode Input

#Include IME.ahk

; Razer Synapseなど、キーカスタマイズ系のツールを併用しているときのエラー対策
#MaxHotkeysPerInterval 350

; 主要なキーを HotKey に設定し、何もせずパススルーする
*~a::
*~b::
*~c::
*~d::
*~e::
*~f::
*~g::
*~h::
*~i::
*~j::
*~k::
*~l::
*~m::
*~n::
*~o::
*~p::
*~q::
*~r::
*~s::
*~t::
*~u::
*~v::
*~w::
*~x::
*~y::
*~z::
*~1::
*~2::
*~3::
*~4::
*~5::
*~6::
*~7::
*~8::
*~9::
*~0::
*~F1::
*~F2::
*~F3::
*~F4::
*~F5::
*~F6::
*~F7::
*~F8::
*~F9::
*~F10::
*~F11::
*~F12::
*~`::
*~~::
*~!::
*~@::
*~#::
*~$::
*~%::
*~^::
*~&::
*~*::
*~(::
*~)::
*~-::
*~_::
*~=::
*~+::
*~[::
*~{::
*~]::
*~}::
*~\::
*~|::
*~;::
*~'::
*~"::
*~,::
*~<::
*~.::
*~>::
*~/::
*~?::
*~Esc::
*~Tab::
*~Space::
*~Left::
*~Right::
*~Up::
*~Down::
*~Enter::
*~PrintScreen::
*~Delete::
*~Home::
*~End::
*~PgUp::
*~PgDn::
    Return

; 上部メニューがアクティブになるのを抑制
;*~LAlt::Send {Blind}{vk07}
;*~RAlt::Send {Blind}{vk07}

; 左 Alt 空打ちで IME を OFF
; LAlt up::
;     if (A_PriorHotkey == "*~LAlt")
;     {
;         IME_SET(0)
;     }
;     Return

; 右 Alt 空打ちで IME を ON
; RAlt up::
;     if (A_PriorHotkey == "*~RAlt")
;     {
;         IME_SET(1)
;     }
;     Return


; Windowsキーに対してIME切り替えを割り当て
LWin::IME_SET(0)

; Windowsキーに対してIME切り替えを割り当て
RWin::IME_SET(1)
vkF2::IME_SET(1)

; ; winをaltにする
LAlt::Alt
RAlt::RWin

; ウインドウ制御

; cmd + w や cmd + qは誤爆が多いため一旦なし

;LWin & W::send ^{F4}
;LWin & Q::send !{F4}
LWin & Tab::AltTab

; Cmdキーエミュレート
; 左Windowsキーをcmdキーに見立てて割り当て

LWin & Enter::send ^{Enter}
LWin & /::send ^/
LWin & X::send ^x
LWin & C::send ^c

LWin & R::
  if GetKeyState("Shift") {
    send +^r
  } else {
    send ^r
  }
Return

LWin & G::
  if GetKeyState("Shift") {
    send +^g
  } else {
    send ^g
  }
Return

LWin & V::
  if GetKeyState("Shift") {
    send +^v
  } else {
    send ^v
  }
Return

LWin & P::send ^p
LWin & T::send ^t
LWin & N::send ^n
LWin & A::send ^a

; LWin & F::send ^f
LWin & F::
  if GetKeyState("Shift") {
    send +^f
  } else {
    send ^f
  }
Return

; ターミナルでcmd + kする時に処理する
LWin & K::send ^l

LWin & S::
  if GetKeyState("Shift") {
    send +^s
  } else {
    send ^s
  }
Return

LWin & Z::
  if GetKeyState("Shift") {
    send +^z
  } else {
    send ^z
  }
Return

; WebStormでよく使用する
LWin & B::
  if GetKeyState("Shift") {
    send +^b
  } else {
    send ^b
  }
Return

; WebStormで設定を開くためのキーバインドを指定
; ほかのアプリもこのキーバインドに変更してもいいかも
LWin & ,::^,

LWin & Up::
  if GetKeyState("Shift") {
    send +^{Home}
  } else {
    send ^{Home}
  }
Return

LWin & Down::
  if GetKeyState("Shift") {
    send +^{End}
  } else {
    send ^{End}
  }
Return

LWin & Right::
  if GetKeyState("Shift") {
    send +{End}
  } else {
    send {End}
  }
Return

LWin & Left::
  if GetKeyState("Shift") {
    send +{Home}
  } else {
    send {Home}
  }
Return

LWin & Space::
    send {Blind}{LWin}
    send {Blind}{LWin up}
return
