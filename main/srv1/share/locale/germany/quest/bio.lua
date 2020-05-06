    ----------------------------------
    -- LvL 30 / Orkzähne
    ----------------------------------
quest bio begin
    state start begin
        when login or levelup with pc.level>29 begin
            set_state(talk_to_disciple_lv30)
        end    
    end
    state talk_to_disciple_lv30 begin
        when letter begin
            local v = find_npc_by_vnum(20084)
            if v != 0 then target.vid("__TARGET__", v, "Biologe")
            end
            send_letter("Die Forschung des Biologen")
        end
        when button or info begin
            say_title("Die Forschung des Biologen")
            say("")
            say("Der Biologe benötigt deine Hilfe.")
            say("Sprich mit ihm.")
            say("")
            say_reward("Sprich mit dem Biologen")
            say("")
        end
        when __TARGET__.target.click or 20084.chat."Orkzähne" begin
            target.delete("__TARGET__")
            say("Biologe:")
            say("")
            say("Oh, du hilfst mir?")
            say("Gut ...")
            say("Ich bin übrigens der Biologe")
            say("und studiere zahlreiches aus der Pflanzenwelt.")
            say("Wenn du mir bei meinen Forschungen hilfst,")
            say("werde ich dich reich belohnen.")
            say("")
            wait()
            say("Biologe:")
            say("Ich habe vor kurzem wieder angefangen ...")
            say("Ich Forsche an einer Legende ...")
            say("Doch habe ich derzeit viel zu tun,")
            say("es währe also nett, wenn du mir hilfst ...")
            say("")
            wait()
            say("Biologe:")
            say("Ich benötige zehn Orkzähne für meine Forschungen.")
            say("Diese sind jedoch sehr zerbrechlich,")
            say("es kann also sein, dass einige bei")
            say("meinen Untersuchungen kaputt gehen.")
            say("Ich benötige alle zehn,")
            say("um meine Forschungen vollenden zu können.")
            say("")
            set_state(collect_orcteeth)
            pc.setqf("duration",0)
            pc.setqf("collect_count",0)
        end
    end
    state collect_orcteeth begin
        when letter begin
            send_letter("Die Forschung des Biologen")
        end
        when button or info begin
            say_title("Orkzähne")
            say("")
            say("Der Biologe gab euch den Auftrag,")
            say("zehn Orkzähne zu sammeln.")
            say("Sammelt und bringt sie dem Biologen.")
            say("")
            say_item_vnum(30006) 
            say_reward("Du hast derzeit "..pc.getqf("collect_count").." abgegeben!")
            say("")
        end
        when 20084.chat."Orkzähne" with pc.count_item(30006)>0 begin
                say("Einen Moment ...")
                say("Vielen Dank,")
                say("lasst mich schnell überprüfen")
                say("ob dieser Zahn in Ordnung ist ...")
                say("")
                pc.remove_item("30006", 1)
                wait()
                local rand = number(0,99)
                if rand<50 then
                    local count = pc.getqf("collect_count")+1
                    if count<10 then
                        pc.setqf("collect_count", count)
                        say("Biologe:")
                        say("Hervorragend, dieser Zahn ist in Ordnung.")
                        say("Bringt mir noch welche, damit ich meine")
                        say("Forschungen abschließen kann.")
                        say("")
                        say_reward("Ihr habt derzeit "..pc.getqf("collect_count").." abgegeben!")
                        say("")
                    else 
                        say("Biologe:")
                        say("Du hast mir die 10 Stück gebracht...")
                        say("Nun bitte ich dich noch, mir den")
                        say("Jinunggyis Seelenstein zu bringen.")
                        say("Du bekommst ihn von Stolzen Orks ...")    
                        say("Ich denke, dafür bist du stark genug.")
                        say("")
                        pc.setqf("collect_count",0)
                        pc.setqf("duration",0) 
                        set_state(collect_jinunggyis)
                    end
                else                                
                    say("Biologe:")
                    say("Es tut mir leid, aber der Zahn ist bei")
                    say("den Untersuchungen zerbrochen.")
                    say("Bitte hol mir einen neuen Orkzahn!")
                    say("")
                end
        end
    end
    state collect_jinunggyis begin
        when letter begin
            send_letter("Jinunggyis Seelenstein")
        end
        when button or info begin
            say_title("Jinunggyis Seelenstein")
            say("")
            say("Ihr habt alle zehn Orkzähne gesammelt.")
            say("Nun müsst ihr Jinunggyis Seelenstein erbeuten.")
            say("")
            say_item_vnum(30220)
            say("Ob dieser Stein tatsächlich eine Seele enthält?")
            say("")
        end
        when 635.kill or 636.kill or 637.kill begin
            if pc.count_item(30220)<1 then
                local rand = number(1,1)    -------- Dropchance des Seelensteins hier 100%
                if rand<5 then pc.give_item2(30220, 1)
                end
            end    
        end
        when 20084.chat."Jinunggyis Seelenstein" begin
            if pc.count_item(30220)>0 then
                say("Biologe:")
                say("Dank deiner Hilfe verstehe ich nun")
                say("die Legende um Jinunggyis Seelenstein.")
                say("Du hast hart gekämpft.")
                say("Sprich mit Baek-Go, er wird dir helfen,")
                say("deine inneren Kräfte zu steigern.")
                say("")
                pc.remove_item(30220,1)
                set_state(jinunggyis_reward)
            else
                say("Biologe:")
                say("Du hast mir die 10 Stück gebracht...")
                say("Nun bitte ich dich noch, mir den")
                say("Jinunggyis Seelenstein zu bringen.")
                say("Du bekommst ihn von Stolzen Orks ...")    
                say("Ich denke, dafür bist du stark genug.")
                say("")        
            end
        end
    end    
    state jinunggyis_reward begin
        when letter begin
            send_letter("Sprich mit Baek-Go")
            local v = find_npc_by_vnum(20018)
            if v != 0 then target.vid("__TARGET__", v, "Doktor")
            end
        end
        when button or info begin
            say("Um die Belohnung des Biologen zu erhalten")
            say("suche mit den Informationen der")
            say("Orkzähne und des Seelensteins Baek-Go auf.")
            say("")
        end
        when __TARGET__.target.click  or 20018.chat."Belohnung des Biologen" begin
            target.delete("__TARGET__")
            say_title("Baek-Go:")
            say("Ich sehe ...")
            say("Der Biologe hat dich zu mir geschickt.")
            say("Hier ist deine Belohnung:")
            say("")
            say_reward("Du erhälst:")
            say_reward("Roter Ebenholzkasten")
            say_reward("Bewegungsgeschwindigkeit +10% (Dauerhaft)")
            say("")
            affect.add_collect(apply.MOV_SPEED, 10, 60*60*24*365*60)
            pc.give_item2("50109")
            set_state(collect_quest_lv40)
        end
    end

    ----------------------------------
    -- LvL 40 / Fluchsammlung
    ----------------------------------
    state collect_quest_lv40 begin
        when login or levelup with pc.level>39 begin
            set_state(talk_to_disciple_lv40)
        end

        when login or levelup with pc.level<40 begin    
            send_letter("Forschung des Biologen 2")
        end
        when button or info begin
            say_title("Forschung des Biologen 2")
            say("")
            say("Um die nächste Biologen Quest zu starten")
            say("musst du mindestens Lv 40 erreicht haben.")
            say("")
            say_reward("Deine Erfahrung reicht im Moment nicht aus")
            say_reward("Du musst mindestens Lv 40 erreichen!")
            say("")
            end
    end

    state talk_to_disciple_lv40 begin
        when letter begin
            local v = find_npc_by_vnum(20084)
            if v != 0 then target.vid("__TARGET__", v, "Biologe")
            end
            send_letter("Forschung des Biologen 2")
        end
        when button or info begin
            say_title("Forschung des Biologen 2")
            say("")
            say("Der Biologe benötigt ein weiteres Mal Hilfe.")
            say("Er meinte, er bräuchte Hilfe auf der Suche")
            say("nach speziellen Gegenständen.")
            say("Sprich mit ihm,")
            say("um eine genauere Beschreibung zu erhalten.")
            say("")
            say_reward("Sprich mit dem Biologen")
            say("")
        end
        when __TARGET__.target.click or 20084.chat."Fluchbücher" begin
            target.delete("__TARGET__")
            say("Biologe:")
            say("Gut, dass du gekommen bist...")
            say("Die Untersuchung der Orkzähne")
            say("habe ich abgeschlossen.")
            say("Nun habe ich neue Objekte gefunden,")
            say("die ich gerne untersuchen würde.")
            wait()
            say("Biologe:")
            say("Ich würde sie ja selber sammeln,")
            say("aber ich habe zuviel zu tun...")
            say("Es wäre sehr nett, wenn du dies")
            say("für mich erledigen könntest.")
            wait()
            say("Biologe:")
            say("Ich möchte die Fluchbücher untersuchen.")
            say("Davon benötige ich 15 Stück.")
            say("Die Bücher sind jedoch ziemlich alt,")
            say("manchmal zerfallen sie einfach!")
            say("")                                                                                                                                                          
            set_state(collect_cursebook)
            pc.setqf("duration",0)
            pc.setqf("collect_count",0)
        end
    end
    state collect_cursebook begin
        when letter begin
            send_letter("Forschung des Biologen 2")
        end
        when button or info begin
            say_title("Fluchsammlungen")
            say("")
            say("Der Biologe gab euch den Auftrag,")
            say("15 Fluchsammlungen zu besorgen.")
            say("Diese kannst du bei den Dunklen- und")
            say("Hohen Peinigern erbeuten.")
            say("")
            say_item_vnum(30047) 
            say_reward("Du hast derzeit "..pc.getqf("collect_count").." abgegeben!")
            say("")
        end
        when 20084.chat."Fluchsammlungen" with pc.count_item(30047)>0 begin
                say("Einen Moment ...")
                say("Vielen Dank,")
                say("lasst mich schnell überprüfen")
                say("ob dieser Zahn in Ordnung ist ...")
                say("")
                pc.remove_item("30047", 1)
                wait()

                local rand = number(0,99)
                if rand<50 then
                    local count = pc.getqf("collect_count")+1
                    if count<15 then
                        pc.setqf("collect_count", count)
                        say("Biologe:")
                        say("Hervorragend, diese Fluchsammlung ist in Ordnung.")
                        say("Bringt mir noch welche, damit ich meine")
                        say("Forschungen abschließen kann.")
                        say("")
                        say_reward("Ihr habt derzeit "..pc.getqf("collect_count").." abgegeben!")
                        say("")
                    else 
                        say("Biologe:")
                        say("Du hast mir die 15 Sammlungen gebracht.")
                        say("Nun, ich habe noch eine Bitte.")
                        say("Ich benötige den Tempelseelenstein,")
                        say("den du von Stolzen dunklen Fanatikern,")
                        say("Kämpfern, sowie Obersten erbeuten kannst.")
                        say("Ich denke, dafür bist du stark genug.")
                        say("")
                        pc.setqf("collect_count",0)
                        pc.setqf("duration",0)
                        set_state(collect_templekey)
                    end
                else                                
                    say("Biologe:")
                    say("Es tut mir leid, die Fluchsammlung")
                    say("ist bei den Untersuchungen zerfallen.")
                    say("Bitte hol mir eine neue Fluchsammlung.")
                end
        end
    end
    state collect_templekey begin
        when letter begin
            send_letter("Tempelseelenstein")
        end
        when button or info begin
            say_title("Tempelseelenstein")
            say("")
            say("Ihr habt alle 15 Fluchsammlungen abgegeben.")
            say("Nun müsst ihr den Tempelseelenstein erbeuten.")
            say("")
            say_item_vnum(30221)
            say("Ob dieser Stein tatsächlich Seelen")
            say("der Tempelanhänger enthält?")
            say("")
        end
        when 731.kill or 733.kill or 734.kill begin
            if pc.count_item(30221)<1 then
                local rand = number(1,1)    -------- Dropchance des Seelensteins hier 100%
                if rand<5 then pc.give_item2(30221, 1)
                end
            end    
        end
        when 20084.chat."Tempelseelenstein" begin
            if pc.count_item(30221)>0 then
                say("Biologe:")
                say("Dank deiner Hilfe verstehe ich nun")
                say("die Legende um den Tempelseelenstein.")
                say("Du hast hart gekämpft.")
                say("Sprich mit Baek-Go, er wird dir helfen,")
                say("deine inneren Kräfte zu steigern.")
                say("")
                pc.remove_item(30221,1)
                set_state(templekey_reward)
            else
                say("Biologe:")
                say("Du hast mir die 15 Sammlungen gebracht.")
                say("Nun, ich habe noch eine Bitte.")
                say("Ich benötige den Tempelseelenstein,")
                say("den du von Stolzen dunklen Fanatikern,")
                say("Kämpfern, sowie Obersten erbeuten kannst.")
                say("Ich denke, dafür bist du stark genug.")
                say("")        
            end
        end
    end
    state templekey_reward begin
        when letter begin
            send_letter("Sprich mit Baek-Go")
            local v = find_npc_by_vnum(20018)
            if v != 0 then target.vid("__TARGET__", v, "Doktor")
            end
        end
        when button or info begin
            say_title("Sprich mit Baek-Go")
            say("Um die Belohnung des Biologen zu erhalten,")
            say("suche mit den Informationen der")
            say("Fluchsammlungen und des Seelensteins")
            say("Baek-Go auf. Er befindet sich in der Stadt.")
            say("")
        end
        when __TARGET__.target.click  or 20018.chat."Belohnung des Biologen" begin
            target.delete("__TARGET__")
            say_title("Baek-Go:")
            say("Ich sehe ...")
            say("Der Biologe hat dich zu mir geschickt.")
            say("Hier ist deine Belohnung:")
            say("")
            say_reward("Du erhälst:")
            say_reward("Prunk Ebenholzkasten")
            say_reward("Angriffsgeschwindigkeit +5% (Dauerhaft)")
            say("")
            affect.add_collect(apply.ATT_SPEED, 5, 60*60*24*365*60)
            pc.give_item2("50110")
            set_state(collect_quest_lv50)
        end
    end

    ----------------------------------
    -- LvL 50 / Dämonenandenken
    ----------------------------------
    state collect_quest_lv50 begin
        when login or levelup with pc.level>49 begin
            set_state(talk_to_disciple_lv50)
        end

        when login or levelup with pc.level<50 begin    
            send_letter("Forschung des Biologen 3")
        end
        when button or info begin
            say_title("Forschung des Biologen 3")
            say("")
            say("Um die nächste Biologen Quest zu starten")
            say("musst du mindestens Lv 50 erreicht haben.")
            say("")
            say_reward("Deine Erfahrung reicht im Moment nicht aus")
            say_reward("Du musst mindestens Lv 50 erreichen!")
            say("")
            end
    end

    state talk_to_disciple_lv50 begin
        when letter begin
            local v = find_npc_by_vnum(20084)
            if v != 0 then target.vid("__TARGET__", v, "Biologe")
            end
            send_letter("Forschung des Biologen 3")
        end
        when button or info begin
            say_title("Forschung des Biologen 3")
            say("")
            say("Der Biologe benötigt ein weiteres Mal Hilfe.")
            say("Er meinte, er bräuchte Hilfe auf der Suche")
            say("nach speziellen Gegenständen.")
            say("Sprich mit ihm,")
            say("um eine genauere Beschreibung zu erhalten.")
            say("")
            say_reward("Sprich mit dem Biologen")
            say("")
        end
        when __TARGET__.target.click or 20084.chat."Dämonenandenken" begin
            target.delete("__TARGET__")
            say("Biologe:")
            say("Gut, dass du gekommen bist...")
            say("Die Untersuchung der Fluchsammlungen")
            say("habe ich abgeschlossen.")
            say("Nun habe ich neue Objekte gefunden,")
            say("die ich gerne untersuchen würde.")
            wait()
            say("Biologe:")
            say("Ich würde sie ja selber sammeln,")
            say("aber ich habe zuviel zu tun...")
            say("Es wäre sehr nett, wenn du dies")
            say("für mich erledigen könntest.")
            wait()
            say("Biologe:")
            say("Ich möchte die Dämonenandenken untersuchen.")
            say("Davon benötige ich 15 Stück.")
            say("Diese sind jedoch ziemlich zerbrechlich,")
            say("es kann also sein, dass einige bei")
            say("meinen Untersuchungen kaputt gehen.")
            say("")                                                                                                                                                          
            set_state(collect_deamonitem)
            pc.setqf("duration",0)
            pc.setqf("collect_count",0)
        end
    end
    state collect_deamonitem begin
        when letter begin
            send_letter("Forschung des Biologen 3")
        end
        when button or info begin
            say_title("Dämonenandenken")
            say("")
            say("Der Biologe gab euch den Auftrag,")
            say("15 Dämonenandenken zu besorgen.")
            say("Diese kannst du bei den Monstern im")
            say("Dämonenturm erbeuten.")
            say("")
            say_item_vnum(30015)
            say_reward("Du hast derzeit "..pc.getqf("collect_count").." abgegeben!")
            say("")
        end
        when 20084.chat."Dämonenandenken" with pc.count_item(30015)>0 begin
                say("Einen Moment ...")
                say("Vielen Dank,")
                say("lasst mich schnell überprüfen")
                say("ob dieser Zahn in Ordnung ist ...")
                say("")
                pc.remove_item("30015", 1)
                wait()
                local rand = number(0,99)
                if rand<50 then
                    local count = pc.getqf("collect_count")+1
                    if count<15 then
                        pc.setqf("collect_count", count)
                        say("Biologe:")
                        say("Hervorragend,")
                        say("dieses Dämonenandenken ist in Ordnung.")
                        say("Bringt mir noch welche, damit ich meine")
                        say("Forschungen abschließen kann.")
                        say("")
                        say_reward("Ihr habt derzeit "..pc.getqf("collect_count").." abgegeben!")
                        say("")
                    else 
                        say("Biologe:")
                        say("Du hast mir die 15 Andenken gebracht.")
                        say("Nun, ich habe noch eine Bitte.")
                        say("Ich benötige Sagyis Seelenstein,")
                        say("den du von den Monstern im Dämonenturm,")
                        say("erbeuten kannst.")
                        say("Ich denke, dafür bist du stark genug.")
                        say("")
                        pc.setqf("collect_count",0)
                        pc.setqf("duration",0) 
                        set_state(collect_sagyis)
                    end
                else                                
                    say("Biologe:")
                    say("Es tut mir leid, das Andenken")
                    say("ist bei den Untersuchungen zerbrochen.")
                    say("Bitte hol mir ein Neues.")
                end
        end
    end
    state collect_sagyis begin
        when letter begin
            send_letter("Sagyis Seelenstein")
        end
        when button or info begin
            say_title("Sagyis Seelenstein")
            say("")
            say("Ihr habt alle 15 Dämonenandenken abgegeben.")
            say("Nun müsst ihr Sagyis Seelenstein erbeuten.")
            say("")
            say_item_vnum(30222)
            say("Ob dieser Stein tatsächlich Seelen")
            say("von Sagyis Adligen enthält?")
            say("")
        end
        when 1001.kill or 1002.kill or 1003.kill or 1004.kill  begin
            if pc.count_item(30222)<1 then
                local rand = number(1,1)    -------- Dropchance des Seelensteins hier 100%
                if rand<5 then pc.give_item2(30222, 1)
                end
            end    
        end
        when 20084.chat."Sagyis Seelenstein" begin
            target.delete("__TARGET__")
            if pc.count_item(30222)>0 then
                say("Biologe:")
                say("Dank deiner Hilfe verstehe ich nun")
                say("die Legende um Sagyis Seelenstein.")
                say("Du hast hart gekämpft.")
                say("Sprich mit Baek-Go, er wird dir helfen,")
                say("deine inneren Kräfte zu steigern.")
                say("")
                pc.remove_item(30222,1)
                set_state(sagyis_reward)
            else
                say("Biologe:")
                say("Du hast mir die 15 Andenken gebracht.")
                say("Nun, ich habe noch eine Bitte.")
                say("Ich benötige Sagyis Seelenstein,")
                say("den du von den Monstern im Dämonenturm,")
                say("erbeuten kannst.")
                say("Ich denke, dafür bist du stark genug.")
                say("")    
            end
        end
    end
    state sagyis_reward begin
        when letter begin
            send_letter("Sprich mit Baek-Go")
            local v = find_npc_by_vnum(20018)
            if v != 0 then target.vid("__TARGET__", v, "Doktor")
            end
        end
        when button or info begin
            say_title("Sprich mit Baek-Go")
            say("Um die Belohnung des Biologen zu erhalten,")
            say("suche mit den Informationen der")
            say("Dämonenandenken und des Seelensteins")
            say("Baek-Go auf. Er befindet sich in der Stadt.")
            say("")
        end
        when __TARGET__.target.click  or 20018.chat."Belohnung des Biologen" begin
            target.delete("__TARGET__")
            say_title("Baek-Go:")
            say("Ich sehe ...")
            say("Der Biologe hat dich zu mir geschickt.")
            say("Hier ist deine Belohnung:")
            say("")
            say_reward("Du erhälst:")
            say_reward("Gelber Ebenholzkasten")
            say_reward("Verteidigung +60 (Dauerhaft)")
            say("")
            affect.add_collect(apply.DEF_GRADE_BONUS,60,60*60*24*365*60)
            pc.give_item2("50111")
            set_state(collect_quest_lv60)
        end
    end

    ----------------------------------
    -- LvL 60 / Eiskugeln
    ----------------------------------
    state collect_quest_lv60 begin
        when login or levelup with pc.level>59 begin
            set_state(talk_to_disciple_lv60)
        end

        when login or levelup with pc.level<60 begin    
            send_letter("Forschung des Biologen 4")
        end
        when button or info begin
            say_title("Forschung des Biologen 4")
            say("")
            say("Um die nächste Biologen Quest zu starten")
            say("musst du mindestens Lv 60 erreicht haben.")
            say("")
            say_reward("Deine Erfahrung reicht im Moment nicht aus")
            say_reward("Du musst mindestens Lv 60 erreichen!")
            say("")
            end
    end
    state talk_to_disciple_lv60 begin
        when letter begin
            local v = find_npc_by_vnum(20084)
            if v != 0 then target.vid("__TARGET__", v, "Biologe")
            end
            send_letter("Forschung des Biologen 4")
        end
        when button or info begin
            say_title("Forschung des Biologen 4")
            say("")
            say("Der Biologe benötigt ein weiteres Mal Hilfe.")
            say("Er meinte, er bräuchte Hilfe auf der Suche")
            say("nach speziellen Gegenständen.")
            say("Sprich mit ihm,")
            say("um eine genauere Beschreibung zu erhalten.")
            say("")
            say_reward("Sprich mit dem Biologen")
            say("")
        end
        when __TARGET__.target.click or 20084.chat."Eiskugeln" begin
            target.delete("__TARGET__")
            say("Biologe:")
            say("Gut, dass du gekommen bist...")
            say("Die Untersuchung der Dämonenandenken")
            say("habe ich abgeschlossen.")
            say("Nun habe ich neue Objekte gefunden,")
            say("die ich gerne untersuchen würde.")
            wait()
            say("Biologe:")
            say("Ich würde sie ja selber sammeln,")
            say("aber ich habe zuviel zu tun...")
            say("Es wäre sehr nett, wenn du dies")
            say("für mich erledigen könntest.")
            wait()
            say("Biologe:")
            say("Ich möchte die Eiskugeln untersuchen.")
            say("Davon benötige ich 20 Stück.")
            say("Diese sind jedoch ziemlich zerbrechlich,")
            say("es kann also sein, dass einige bei")
            say("meinen Untersuchungen kaputt gehen.")
            say("")                                                                                                                                                          
            set_state(collect_scoops)
            pc.setqf("duration",0)
            pc.setqf("collect_count",0)
        end
    end
    state collect_scoops begin
        when letter begin
            send_letter("Forschung des Biologen 4")
        end
        when button or info begin
            say_title("Eiskugeln")
            say("")
            say("Der Biologe gab euch den Auftrag,")
            say("20 Eiskugeln zu besorgen.")
            say("Diese kannst du bei den Eisgolems auf")
            say("dem Berg Sohan erbeuten.")
            say("")
            say_item_vnum(30050)
            say_reward("Du hast derzeit "..pc.getqf("collect_count").." abgegeben!")
            say("")
        end
        when 20084.chat."Eiskugel" with pc.count_item(30050)>0 begin
                say("Einen Moment ...")
                say("Vielen Dank,")
                say("lasst mich schnell überprüfen")
                say("ob dieser Zahn in Ordnung ist ...")
                say("")
                pc.remove_item("30050", 1)
                wait()
                local rand = number(0,99)
                if rand<50 then
                    local count = pc.getqf("collect_count")+1
                    if count<20 then
                        pc.setqf("collect_count", count)
                        say("Biologe:")
                        say("Hervorragend,")
                        say("diese Eiskugel ist in Ordnung.")
                        say("Bringt mir noch welche, damit ich meine")
                        say("Forschungen abschließen kann.")
                        say("")
                        say_reward("Ihr habt derzeit "..pc.getqf("collect_count").." abgegeben!")
                        say("")
                    else 
                        say("Biologe:")
                        say("Du hast mir die 20 Eiskugeln gebracht.")
                        say("Nun, ich habe noch eine Bitte.")
                        say("Ich benötige Aurtumryus Seelenstein,")
                        say("den du von den Eismonstern auf dem Berg Sohan,")
                        say("erbeuten kannst.")
                        say("Ich denke, dafür bist du stark genug.")
                        say("")
                        pc.setqf("collect_count",0)
                        pc.setqf("duration",0) 
                        set_state(collect_aurtumryus)
                    end
                else                                
                    say("Biologe:")
                    say("Es tut mir leid, die Eiskugel")
                    say("ist bei den Untersuchungen zerbrochen.")
                    say("Bitte hol mir eine Neue.")
                end
        end
    end
    state collect_aurtumryus begin
        when letter begin
            send_letter("Aurtumryus Seelenstein")
        end
        when button or info begin
            say_title("Aurtumryus Seelenstein")
            say("")
            say("Ihr habt alle 20 Eiskugeln abgegeben.")
            say("Nun müsst ihr Aurtumryus Seelenstein erbeuten.")
            say("")
            say_item_vnum(30223)
            say("Ob dieser Stein tatsächlich Seelen")
            say("von Aurtumryus Adligen enthält?")
            say("")
        end
        when 1102.kill or 1104.kill or 1105.kill begin
            if pc.count_item(30223)<1 then
                local rand = number(1,1)    -------- Dropchance des Seelensteins hier 100%
                if rand<5 then pc.give_item2(30223, 1)
                end
            end    
        end
        when 20084.chat."Aurtumryus Seelenstein" begin
            if pc.count_item(30223)>0 then
                say("Biologe:")
                say("Dank deiner Hilfe verstehe ich nun")
                say("die Legende um Aurtumryus Seelenstein.")
                say("Du hast hart gekämpft.")
                say("Sprich mit Baek-Go, er wird dir helfen,")
                say("deine inneren Kräfte zu steigern.")
                say("")
                pc.remove_item(30223,1)
                set_state(aurtumryus_reward)
            else
                say("Biologe:")
                say("Du hast mir die 20 Eiskugeln gebracht.")
                say("Nun, ich habe noch eine Bitte.")
                say("Ich benötige Aurtumryus Seelenstein,")
                say("den du von den Eismonstern auf dem Berg Sohan,")
                say("erbeuten kannst.")
                say("Ich denke, dafür bist du stark genug.")
                say("")            
            end
        end
    end
    state aurtumryus_reward begin
        when letter begin
            send_letter("Sprich mit Baek-Go")
            local v = find_npc_by_vnum(20018)
            if v != 0 then target.vid("__TARGET__", v, "Doktor")
            end
        end
        when button or info begin
            say_title("Sprich mit Baek-Go")
            say("Um die Belohnung des Biologen zu erhalten,")
            say("suche mit den Informationen der")
            say("Eiskugeln und des Seelensteins")
            say("Baek-Go auf. Er befindet sich in der Stadt.")
            say("")
        end
        when __TARGET__.target.click  or 20018.chat."Belohnung des Biologen" begin
            target.delete("__TARGET__")
            say_title("Baek-Go:")
            say("Ich sehe ...")
            say("Der Biologe hat dich zu mir geschickt.")
            say("Hier ist deine Belohnung:")
            say("")
            say_reward("Du erhälst:")
            say_reward("Hellgrüner Ebenholzkasten")
            say_reward("Angriffswert +50 (Dauerhaft)")
            say("")
            affect.add_collect(apply.ATT_GRADE_BONUS,50,60*60*24*365*60)
            pc.give_item2("50112")
            set_state(collect_quest_lv70)
        end
    end

    ----------------------------------
    -- LvL 70 / Zelkovas Holzäste
    ----------------------------------
    state collect_quest_lv70 begin
        when login or levelup with pc.level>69 begin
            set_state(talk_to_disciple_lv70)
        end

        when login or levelup with pc.level<70 begin    
            send_letter("Forschung des Biologen 5")
        end
        when button or info begin
            say_title("Forschung des Biologen 5")
            say("")
            say("Um die nächste Biologen Quest zu starten")
            say("musst du mindestens Lv 70 erreicht haben.")
            say("")
            say_reward("Deine Erfahrung reicht im Moment nicht aus")
            say_reward("Du musst mindestens Lv 70 erreichen!")
            say("")
            end
    end

    state talk_to_disciple_lv70 begin
        when letter begin
            local v = find_npc_by_vnum(20084)
            if v != 0 then target.vid("__TARGET__", v, "Biologe")
            end
            send_letter("Forschung des Biologen 5")
        end
        when button or info begin
            say_title("Forschung des Biologen 5")
            say("")
            say("Der Biologe benötigt ein weiteres Mal Hilfe.")
            say("Er meinte, er bräuchte Hilfe auf der Suche")
            say("nach speziellen Gegenständen.")
            say("Sprich mit ihm,")
            say("um eine genauere Beschreibung zu erhalten.")
            say("")
            say_reward("Sprich mit dem Biologen")
            say("")
        end
        when __TARGET__.target.click or 20084.chat."Zelkovas Holzäste" begin
            target.delete("__TARGET__")
            say("Biologe:")
            say("Gut, dass du gekommen bist...")
            say("Die Untersuchung der Eiskugeln")
            say("habe ich abgeschlossen.")
            say("Nun habe ich neue Objekte gefunden,")
            say("die ich gerne untersuchen würde.")
            wait()
            say("Biologe:")
            say("Ich würde sie ja selber sammeln,")
            say("aber ich habe zuviel zu tun...")
            say("Es wäre sehr nett, wenn du dies")
            say("für mich erledigen könntest.")
            wait()
            say("Biologe:")
            say("Ich möchte Zelkovas Holzäste untersuchen.")
            say("Davon benötige ich 25 Stück.")
            say("Diese welken jedoch ziemlich schnell,")
            say("es kann also sein, dass einige für")
            say("meine Untersuchungen unbrauchbar sind.")
            say("")                                                                                                                                                          
            set_state(collect_branches)
            pc.setqf("duration",0)
            pc.setqf("collect_count",0)
        end
    end
    state collect_branches begin
        when letter begin
            send_letter("Forschung des Biologen 5")
        end
        when button or info begin
            say_title("Zelkovas Holzäste")
            say("")
            say("Der Biologe gab euch den Auftrag,")
            say("25 von Zelkovas Holzästen zu besorgen.")
            say("Diese kannst du bei den Monstern")
            say("im Geisterwald erbeuten.")
            say("")
            say_item_vnum(30165)
            say_reward("Du hast derzeit "..pc.getqf("collect_count").." abgegeben!")
            say("")
        end
        when 20084.chat."Zelkovas Holzäste" with pc.count_item(30165)>0 begin
                say("Einen Moment ...")
                say("Vielen Dank,")
                say("lasst mich schnell überprüfen")
                say("ob dieser Holzast in Ordnung ist ...")
                say("")
                pc.remove_item("30165", 1)
                wait()
                local rand = number(0,99)
                if rand<50 then
                    local count = pc.getqf("collect_count")+1
                    if count<25 then
                        pc.setqf("collect_count", count)
                        say("Biologe:")
                        say("Hervorragend,")
                        say("dieser Holzast ist in Ordnung.")
                        say("Bringt mir noch welche, damit ich meine")
                        say("Forschungen abschließen kann.")
                        say("")
                        say_reward("Ihr habt derzeit "..pc.getqf("collect_count").." abgegeben!")
                        say("")
                    else 
                        say("Biologe:")
                        say("Du hast mir die 25 Holzäste gebracht.")
                        say("Nun, ich habe noch eine Bitte.")
                        say("Ich benötige Gyimoks Seelenstein,")
                        say("den du ebenfalls von den Monstern")
                        say("im Geisterwald erbeuten kannst.")
                        say("Ich denke, dafür bist du stark genug.")
                        say("")
                        pc.setqf("collect_count",0)
                        pc.setqf("duration",0) 
                        set_state(collect_gyimoks)
                    end
                else                                
                    say("Biologe:")
                    say("Es tut mir leid, der Holzast")
                    say("ist während des Transports verwelkt.")
                    say("Bitte hol mir einen Neuen.")
                end
        end
    end
    state collect_gyimoks begin
        when letter begin
            send_letter("Gyimoks Seelenstein")
        end
        when button or info begin
            say_title("Gyimoks Seelenstein")
            say("")
            say("Ihr habt alle 25 Äste abgegeben.")
            say("Nun müsst ihr Gyimoks Seelenstein erbeuten.")
            say("")
            say_item_vnum(30224)
            say("Ob dieser Stein tatsächlich Seelen")
            say("von Gyimoks Adligen enthält?")
            say("")
        end
        when 2301.kill or 2302.kill or 2303.kill or 2304.kill or 2305.kill or 2311.kill or 
             2312.kill or 2313.kill or 2314.kill or 2315.kill or 2306.kill or 2307.kill begin
            if pc.count_item(30224)<1 then
                local rand = number(1,1)    -------- Dropchance des Seelensteins hier 100%
                if rand<5 then pc.give_item2(30224, 1)
                end
            end    
        end
        when 20084.chat."Gyimoks Seelenstein" begin
            target.delete("__TARGET__")
            if pc.count_item(30224)>0 then
                say("Biologe:")
                say("Dank deiner Hilfe verstehe ich nun")
                say("die Legende um Gyimoks Seelenstein.")
                say("Du hast hart gekämpft.")
                say("Sprich mit Baek-Go, er wird dir helfen,")
                say("deine inneren Kräfte zu steigern.")
                say("")
                pc.remove_item(30224,1)
                set_state(gyimoks_reward)
            else
                say("Biologe:")
                say("Du hast mir die 25 Holzäste gebracht.")
                say("Nun...ich habe noch eine Bitte.")
                say("Ich benötige Gyimoks Seelenstein,")
                say("den du ebenfalls von den Monstern")
                say("im Geisterwald erbeuten kannst.")
                say("Ich denke, dafür bist du stark genug.")
                say("")            
            end
        end
    end
    state gyimoks_reward begin
        when letter begin
            send_letter("Sprich mit Baek-Go")
            local v = find_npc_by_vnum(20018)
            if v != 0 then target.vid("__TARGET__", v, "Doktor")
            end
        end
        when button or info begin
            say_title("Sprich mit Baek-Go")
            say("Um die Belohnung des Biologen zu erhalten,")
            say("suche mit den Informationen der")
            say("Zelkova Holzäste und des Seelensteins")
            say("Baek-Go auf. Er befindet sich in der Stadt.")
            say("")
        end
        when __TARGET__.target.click  or 20018.chat."Belohnung des Biologen" begin
            target.delete("__TARGET__")
            say_title("Baek-Go:")
            say("Ich sehe ...")
            say("Der Biologe hat dich zu mir geschickt.")
            say("Hier ist deine Belohnung:")
            say("")
            say_reward("Du erhälst:")
            say_reward("Grüner Ebenholzkasten")
            say_reward("Bewegungsgeschwindigkeit +10% (Dauerhaft)")
            say_reward("Schadensreduzierung +10% (Dauerhaft)")
            say("")
            affect.add_collect(apply.MOV_SPEED,10,60*60*24*365*60)
            affect.add_collect(apply.POINT_DEF_BONUS,10,60*60*24*365*60)
            pc.give_item2("50113")
            set_state(collect_quest_lv80)
        end
    end

    ----------------------------------
    -- LvL 80 / Tugyis Tafeln
    ----------------------------------
    state collect_quest_lv80 begin
        when login or levelup with pc.level>79 begin
            set_state(talk_to_disciple_lv80)
        end

        when login or levelup with pc.level<80 begin    
            send_letter("Forschung des Biologen 6")
        end
        when button or info begin
            say_title("Forschung des Biologen 6")
            say("")
            say("Um die nächste Biologen Quest zu starten")
            say("musst du mindestens Lv 80 erreicht haben.")
            say("")
            say_reward("Deine Erfahrung reicht im Moment nicht aus")
            say_reward("Du musst mindestens Lv 80 erreichen!")
            say("")
            end
    end

    state talk_to_disciple_lv80 begin
        when letter begin
            local v = find_npc_by_vnum(20084)
            if v != 0 then target.vid("__TARGET__", v, "Biologe")
            end
            send_letter("Forschung des Biologen 6")
        end
        when button or info begin
            say_title("Forschung des Biologen 6")
            say("")
            say("Der Biologe benötigt ein weiteres Mal Hilfe.")
            say("Er meinte, er bräuchte Hilfe auf der Suche")
            say("nach speziellen Gegenständen.")
            say("Sprich mit ihm,")
            say("um eine genauere Beschreibung zu erhalten.")
            say("")
            say_reward("Sprich mit dem Biologen")
            say("")
        end
        when __TARGET__.target.click or 20084.chat."Tugyis Tafeln" begin
            target.delete("__TARGET__")
            say("Biologe:")
            say("Gut, dass du gekommen bist...")
            say("Die Untersuchung der Zelkova Holzäste")
            say("habe ich abgeschlossen.")
            say("Nun habe ich neue Objekte gefunden,")
            say("die ich gerne untersuchen würde.")
            wait()
            say("Biologe:")
            say("Ich würde sie ja selber sammeln,")
            say("aber ich habe zuviel zu tun...")
            say("Es wäre sehr nett, wenn du dies")
            say("für mich erledigen könntest.")
            wait()
            say("Biologe:")
            say("Ich möchte Tugyis Tafeln untersuchen.")
            say("Davon benötige ich 30 Stück.")
            say("Diese sind jedoch ziemlich zerbrechlich,")
            say("es kann also sein, dass einige bei")
            say("meinen Untersuchungen kaputt gehen.")
            say("")                                                                                                                                                          
            set_state(collect_plates)
            pc.setqf("duration",0)
            pc.setqf("collect_count",0)
        end
    end
    state collect_plates begin
        when letter begin
            send_letter("Forschung des Biologen 6")
        end
        when button or info begin
            say_title("Tugyis Tafeln")
            say("")
            say("Der Biologe gab euch den Auftrag,")
            say("30 von Tugyis Tafeln zu besorgen.")
            say("Diese kannst du bei den Monstern")
            say("im Land der Riesen erbeuten.")
            say("")
            say_item_vnum(30166)
            say_reward("Du hast derzeit "..pc.getqf("collect_count").." abgegeben!")
            say("")
        end
        when 1401.kill or 1402.kill or 1403.kill or 1601.kill or 1602.kill or 1603.kill begin
            local rand = number(1,1)    -------- Dropchance der Tafeln hier 100%
            if rand<5 then pc.give_item2(30166, 1)
            end
        end
        when 20084.chat."Tugyis Tafeln" with pc.count_item(30166)>0 begin
                say("Einen Moment ...")
                say("Vielen Dank,")
                say("lasst mich schnell überprüfen")
                say("ob diese Tafel in Ordnung ist ...")
                say("")
                pc.remove_item("30166", 1)
                wait()
                local rand = number(0,99)
                if rand<50 then
                    local count = pc.getqf("collect_count")+1
                    if count<30 then
                        pc.setqf("collect_count", count)
                        say("Biologe:")
                        say("Hervorragend,")
                        say("diese Tafel ist in Ordnung.")
                        say("Bringt mir noch welche, damit ich meine")
                        say("Forschungen abschließen kann.")
                        say("")
                        say_reward("Ihr habt derzeit "..pc.getqf("collect_count").." abgegeben!")
                        say("")
                    else 
                        say("Biologe:")
                        say("Du hast mir die 30 Tafeln gebracht.")
                        say("Nun, ich habe noch eine Bitte.")
                        say("Ich benötige Tugyis Seelenstein,")
                        say("den du ebenfalls von den Monstern")
                        say("im Land der Riesen erbeuten kannst.")
                        say("Ich denke, dafür bist du stark genug.")
                        say("")
                        pc.setqf("collect_count",0)
                        pc.setqf("duration",0) 
                        set_state(collect_tugyis)
                    end
                else                                
                    say("Biologe:")
                    say("Es tut mir leid, die Tafel")
                    say("ist während der Untersuchung zerbrochen.")
                    say("Bitte hol mir eine Neue.")
                end
        end
    end
    state collect_tugyis begin
        when letter begin
            send_letter("Tugyis Seelenstein")
        end
        when button or info begin
            say_title("Tugyis Seelenstein")
            say("")
            say("Ihr habt alle 30 Tafeln abgegeben.")
            say("Nun müsst ihr Tugyis Seelenstein erbeuten.")
            say("")
            say_item_vnum(30225)
            say("Ob dieser Stein tatsächlich Seelen")
            say("von Tugyis Adligen enthält?")
            say("")
        end
        when 1401.kill or 1402.kill or 1403.kill or 1601.kill or 1602.kill or 1603.kill begin
            if pc.count_item(30225)<1 then
                local rand = number(1,1)    -------- Dropchance des Seelensteins hier 100%
                if rand<5 then pc.give_item2(30225, 1)
                end
            end    
        end
        when 20084.chat."Tugyis Seelenstein" begin
            if pc.count_item(30225)>0 then
                say("Biologe:")
                say("Dank deiner Hilfe verstehe ich nun")
                say("die Legende um Tugyis Seelenstein.")
                say("Du hast hart gekämpft.")
                say("Sprich mit Baek-Go, er wird dir helfen,")
                say("deine inneren Kräfte zu steigern.")
                say("")
                pc.remove_item(30225,1)
                set_state(tugyis_reward)
            else
                say("Biologe:")
                say("Du hast mir die 30 Tafeln gebracht.")
                say("Nun, ich habe noch eine Bitte.")
                say("Ich benötige Tugyis Seelenstein,")
                say("den du ebenfalls von den Monstern")
                say("im Land der Riesen erbeuten kannst.")
                say("Ich denke, dafür bist du stark genug.")
                say("")            
            end
        end
    end
    state tugyis_reward begin
        when letter begin
            send_letter("Sprich mit Baek-Go")
            local v = find_npc_by_vnum(20018)
            if v != 0 then target.vid("__TARGET__", v, "Doktor")
            end
        end
        when button or info begin
            say_title("Sprich mit Baek-Go")
            say("Um die Belohnung des Biologen zu erhalten,")
            say("suche mit den Informationen der")
            say("Tugyis Tafeln und des Seelensteins")
            say("Baek-Go auf. Er befindet sich in der Stadt.")
            say("")
        end
        when __TARGET__.target.click  or 20018.chat."Belohnung des Biologen" begin
            target.delete("__TARGET__")
            say_title("Baek-Go:")
            say("Ich sehe ...")
            say("Der Biologe hat dich zu mir geschickt.")
            say("Hier ist deine Belohnung:")
            say("")
            say_reward("Du erhälst:")
            say_reward("Blauer Ebenholzkasten")
            say_reward("Angriffsgeschwindigkeit +5% (Dauerhaft)")
            say_reward("Schadenserhöhung +10% (Dauerhaft)")
            say("")
            affect.add_collect(apply.ATT_SPEED,5,60*60*24*365*60)
            affect.add_collect_point(apply.POINT_ATT_BONUS,10,60*60*24*365*60)
            pc.give_item2("50114")
            set_state(collect_quest_lv85)
        end
    end

    ----------------------------------
    -- LvL 85 / Geisterbaum Äste
    ----------------------------------
    state collect_quest_lv85 begin
        when login or levelup with pc.level>84 begin
            set_state(talk_to_disciple_lv85)
        end

        when login or levelup with pc.level<85 begin    
            send_letter("Forschung des Biologen 7")
        end
        when button or info begin
            say_title("Forschung des Biologen 7")
            say("")
            say("Um die nächste Biologen Quest zu starten")
            say("musst du mindestens Lv 85 erreicht haben.")
            say("")
            say_reward("Deine Erfahrung reicht im Moment nicht aus")
            say_reward("Du musst mindestens Lv 85 erreichen!")
            say("")
            end
    end

    state talk_to_disciple_lv85 begin
        when letter begin
            local v = find_npc_by_vnum(20084)
            if v != 0 then target.vid("__TARGET__", v, "Biologe")
            end
            send_letter("Forschung des Biologen 7")
        end
        when button or info begin
            say_title("Forschung des Biologen 7")
            say("")
            say("Der Biologe benötigt ein weiteres Mal Hilfe.")
            say("Er meinte, er bräuchte Hilfe auf der Suche")
            say("nach speziellen Gegenständen.")
            say("Sprich mit ihm,")
            say("um eine genauere Beschreibung zu erhalten.")
            say("")
            say_reward("Sprich mit dem Biologen")
            say("")
        end
        when __TARGET__.target.click or 20084.chat."Rote Geisterbaumäste" begin
            target.delete("__TARGET__")
            say("Biologe:")
            say("Gut, dass du gekommen bist...")
            say("Die Untersuchung der Tugyis Tafeln")
            say("habe ich abgeschlossen.")
            say("Nun habe ich neue Objekte gefunden,")
            say("die ich gerne untersuchen würde.")
            wait()
            say("Biologe:")
            say("Ich würde sie ja selber sammeln,")
            say("aber ich habe zuviel zu tun...")
            say("Es wäre sehr nett, wenn du dies")
            say("für mich erledigen könntest.")
            wait()
            say("Biologe:")
            say("Ich möchte Rote Geisterbaumäste untersuchen.")
            say("Davon benötige ich 40 Stück.")
            say("Diese sind jedoch ziemlich verwelkt,")
            say("es kann also sein, dass einige bei")
            say("meinen Untersuchungen kaputt gehen.")
            say("")                                                                                                                                                          
            set_state(collect_ast)
            pc.setqf("duration",0)
            pc.setqf("collect_count",0)
        end
    end
    state collect_ast begin
        when letter begin
            send_letter("Forschung des Biologen 7")
        end
        when button or info begin
            say_title("Rote Geisterbaumäste")
            say("")
            say("Der Biologe gab euch den Auftrag,")
            say("40 von Rote Geisterbaumäste zu besorgen.")
            say("Diese kannst du bei den Monstern")
            say("im Roten Wald erbeuten.")
            say("")
            say_item_vnum(30166)
            say_reward("Du hast derzeit "..pc.getqf("collect_count").." abgegeben!")
            say("")
        end
        when 2311.kill or 2312.kill or 2313.kill or 2314.kill or 2315.kill begin
            local rand = number(1,20)    -------- Dropchance eines Geisterbaum Astes hier 5%
            if rand<5 then pc.give_item2(30167, 1)
            end
        end
        when 20084.chat."Rote Geisterbaumäste" with pc.count_item(30167)>0 begin
                say("Einen Moment ...")
                say("Vielen Dank,")
                say("lasst mich schnell überprüfen")
                say("ob diesr Ast in Ordnung ist ...")
                say("")
                pc.remove_item("30167", 1)
                wait()
                local rand = number(0,99)
                if rand<50 then
                    local count = pc.getqf("collect_count")+1
                    if count<30 then
                        pc.setqf("collect_count", count)
                        say("Biologe:")
                        say("Hervorragend,")
                        say("dieser Ast ist in Ordnung.")
                        say("Bringt mir noch welche, damit ich meine")
                        say("Forschungen abschließen kann.")
                        say("")
                        say_reward("Ihr habt derzeit "..pc.getqf("collect_count").." abgegeben!")
                        say("")
                    else 
                        say("Biologe:")
                        say("Du hast mir die 40 Äste gebracht.")
                        say("Nun, ich habe noch eine Bitte.")
                        say("Ich benötige Waldgeist-Seelenstein,")
                        say("den du ebenfalls von den Monstern")
                        say("im Roten Wald erbeuten kannst.")
                        say("Ich denke, dafür bist du stark genug.")
                        say("")
                        pc.setqf("collect_count",0)
                        pc.setqf("duration",0) 
                        set_state(collect_waldseeli)
                    end
                else                                
                    say("Biologe:")
                    say("Es tut mir leid, der Ast")
                    say("ist während der Untersuchung verwelkt.")
                    say("Bitte hol mir einen Neuen.")
                end
        end
    end
    state collect_waldseeli begin
        when letter begin
            send_letter("Waldgeist-Seelenstein")
        end
        when button or info begin
            say_title("Waldgeist-Seelenstein")
            say("")
            say("Ihr habt alle 40 Äste abgegeben.")
            say("Nun müsst ihr den Waldgeist-Seelenstein erbeuten.")
            say("")
            say_item_vnum(30226)
            say("Ob dieser Stein tatsächlich Seelen")
            say("von Tugyis Adligen enthält?")
            say("")
        end
        when 2311.kill or 2312.kill or 2313.kill or 2314.kill or 2315.kill begin
            if pc.count_item(30226)<1 then
                local rand = number(1,1)    -------- Dropchance des Seelensteins hier 100%
                if rand<5 then pc.give_item2(30226, 1)
                end
            end    
        end
        when 20084.chat."Waldgeist-Seelenstein" begin
            if pc.count_item(30226)>0 then
                say("Biologe:")
                say("Dank deiner Hilfe verstehe ich nun")
                say("die Legende um den Waldgeist-Seelenstein.")
                say("Du hast hart gekämpft.")
                say("Sprich mit Baek-Go, er wird dir helfen,")
                say("deine inneren Kräfte zu steigern.")
                say("")
                pc.remove_item(30226,1)
                set_state(waldgeist_reward)
            else
                say("Biologe:")
                say("Du hast mir die 40 Äste gebracht.")
                say("Nun, ich habe noch eine Bitte.")
                say("Ich benötige Waldgeist-Seelenstein,")
                say("den du ebenfalls von den Monstern")
                say("im Roten Wald erbeuten kannst.")
                say("Ich denke, dafür bist du stark genug.")
                say("")            
            end
        end
    end
    state waldgeist_reward begin
        when letter begin
            send_letter("Sprich mit Baek-Go")
            local v = find_npc_by_vnum(20018)
            if v != 0 then target.vid("__TARGET__", v, "Doktor")
            end
        end
        when button or info begin
            say_title("Sprich mit Baek-Go")
            say("Um die Belohnung des Biologen zu erhalten,")
            say("suche mit den Informationen der")
            say("Geisterbaum Äste und des Seelensteins")
            say("Baek-Go auf. Er befindet sich in der Stadt.")
            say("")
        end
        when __TARGET__.target.click  or 20018.chat."Belohnung des Biologen" begin
            target.delete("__TARGET__")
            say_title("Baek-Go:")
            say("Ich sehe ...")
            say("Der Biologe hat dich zu mir geschickt.")
            say("Hier ist deine Belohnung:")
            say("")
            say_reward("Du erhälst:")
            say_reward("Purpur Ebenholzkasten")
            say_reward("PvP Schadensreduzierung +10% (Dauerhaft)")
            say("")
            affect.add_collect(apply.RESIST_ASSASSIN,10,60*60*24*365*60)
            affect.add_collect(apply.RESIST_SURA,10,60*60*24*365*60)
            affect.add_collect(apply.RESIST_SHAMAN,10,60*60*24*365*60)
            affect.add_collect(apply.RESIST_WARRIOR,10,60*60*24*365*60)
            pc.give_item2("50115")
            set_state(collect_quest_lv90)
        end
    end

    ----------------------------------
    -- LvL 90 / Notiz der Anführer
    ----------------------------------
    state collect_quest_lv90 begin
        when login or levelup with pc.level>79 begin
            set_state(talk_to_disciple_lv90)
        end

        when login or levelup with pc.level<90 begin    
            send_letter("Forschung des Biologen 8")
        end
        when button or info begin
            say_title("Forschung des Biologen 8")
            say("")
            say("Um die nächste Biologen Quest zu starten")
            say("musst du mindestens Lv 90 erreicht haben.")
            say("")
            say_reward("Deine Erfahrung reicht im Moment nicht aus")
            say_reward("Du musst mindestens Lv 90 erreichen!")
            say("")
            end
    end

    state talk_to_disciple_lv90 begin
        when letter begin
            local v = find_npc_by_vnum(20084)
            if v != 0 then target.vid("__TARGET__", v, "Biologe")
            end
            send_letter("Forschung des Biologen 8")
        end
        when button or info begin
            say_title("Forschung des Biologen 8")
            say("")
            say("Der Biologe benötigt ein weiteres Mal Hilfe.")
            say("Er meinte, er bräuchte Hilfe auf der Suche")
            say("nach speziellen Gegenständen.")
            say("Sprich mit ihm,")
            say("um eine genauere Beschreibung zu erhalten.")
            say("")
            say_reward("Sprich mit dem Biologen")
            say("")
        end
        when __TARGET__.target.click or 20084.chat."Notiz der Anführer" begin
            target.delete("__TARGET__")
            say("Biologe:")
            say("Gut, dass du gekommen bist...")
            say("Die Untersuchung der Tugyis Tafeln")
            say("habe ich abgeschlossen.")
            say("Nun habe ich neue Objekte gefunden,")
            say("die ich gerne untersuchen würde.")
            wait()
            say("Biologe:")
            say("Ich würde sie ja selber sammeln,")
            say("aber ich habe zuviel zu tun...")
            say("Es wäre sehr nett, wenn du dies")
            say("für mich erledigen könntest.")
            wait()
            say("Biologe:")
            say("Ich möchte Notizen der Anführer untersuchen.")
            say("Davon benötige ich 50 Stück.")
            say("Es kann jedoch sein, dass sich einige")
            say("Notizen als alt und unlesbar herausstellen.")
            say("")                                                                                                                                                          
            set_state(collect_notices)
            pc.setqf("duration",0)
            pc.setqf("collect_count",0)
        end
    end
    state collect_notices begin
        when letter begin
            send_letter("Forschung des Biologen 8")
        end
        when button or info begin
            say_title("Notiz der Anführer")
            say("")
            say("Der Biologe gab euch den Auftrag,")
            say("50 Notizen der Anführer zu besorgen.")
            say("Diese kannst du von den Bossen")
            say("wie z.B. Oberork, Königsspinne,")
            say("Neunschwanz, etc. erbeuten.")
            say("")
            say_item_vnum(30168)
            say_reward("Du hast derzeit "..pc.getqf("collect_count").." abgegeben!")
            say("")
        end
        when 591.kill or 691.kill or 791.kill or 793.kill or 991.kill or 992.kill or 993.kill or 1091.kill or 1092.kill or 1093.kill or 1304.kill or
             1403.kill or 2091.kill or 2191.kill or 2206.kill or 2207.kill or 2306.kill or 2493.kill or 2494.kill or 5001.kill or 5004.kill or
             5161.kill or 5162.kill or 5163.kill begin
            local rand = number(1,1)    -------- Dropchance einer Notiz hier 100%
            if rand<5 then pc.give_item2(30168, 1)
            end
        end
        when 20084.chat."Notiz der Anführer" with pc.count_item(30168)>0 begin
                say("Einen Moment ...")
                say("Vielen Dank,")
                say("lasst mich schnell überprüfen")
                say("ob diese Notiz lesbar ist ...")
                say("")
                pc.remove_item("30168", 1)
                wait()
                local rand = number(0,99)
                if rand<50 then
                    local count = pc.getqf("collect_count")+1
                    if count<50 then
                        pc.setqf("collect_count", count)
                        say("Biologe:")
                        say("Hervorragend,")
                        say("diese Notiz ist in Ordnung.")
                        say("Bringt mir noch welche, damit ich meine")
                        say("Forschungen abschließen kann.")
                        say("")
                        say_reward("Ihr habt derzeit "..pc.getqf("collect_count").." abgegeben!")
                        say("")
                    else 
                        say("Biologe:")
                        say("Du hast mir die 50 Notizen gebracht.")
                        say("Nun, ich habe noch eine Bitte.")
                        say("Ich benötige den Seelenstein der Anführer,")
                        say("den du ebenfalls von den Bossen")
                        say("erbeuten kannst.")
                        say("Ich denke, dafür bist du stark genug.")
                        say("")
                        pc.setqf("collect_count",0)
                        pc.setqf("duration",0) 
                        set_state(collect_bossKey)
                    end
                else                                
                    say("Biologe:")
                    say("Es tut mir leid, die Notiz")
                    say("hat sich als unlesbar herausgestellt.")
                    say("Bitte hol mir eine Neue.")
                end
        end
    end
    state collect_bossKey begin
        when letter begin
            send_letter("Seelenstein der Anführer")
        end
        when button or info begin
            say_title("Seelenstein der Anführer")
            say("")
            say("Ihr habt alle 50 Notizen abgegeben.")
            say("Nun müsst ihr den Seelenstein der Anführer")
            say("erbeuten.")
            say("")
            say_item_vnum(30227)
            say("Ob dieser Stein tatsächlich Seelen")
            say("der Anführer enthält?")
            say("")
        end
        when 591.kill or 691.kill or 791.kill or 793.kill or 991.kill or 992.kill or 993.kill or 1091.kill or 1092.kill or 1093.kill or 1304.kill or
             1403.kill or 2091.kill or 2191.kill or 2206.kill or 2207.kill or 2306.kill or 2493.kill or 2494.kill or 5001.kill or 5004.kill or
             5161.kill or 5162.kill or 5163.kill begin
            if pc.count_item(30227)<1 then
                local rand = number(1,1)    -------- Dropchance des Seelensteins hier 100%
                if rand<5 then pc.give_item2(30227, 1)
                end
            end    
        end
        when 20084.chat."Seelenstein der Anführer" begin
            if pc.count_item(30227)>0 then
                say("Biologe:")
                say("Dank deiner Hilfe verstehe ich nun")
                say("die Legende um den Seelenstein der Anführer.")
                say("Du hast hart gekämpft.")
                say("Sprich mit Baek-Go, er wird dir helfen,")
                say("deine inneren Kräfte zu steigern.")
                say("")
                pc.remove_item(30227,1)
                set_state(bossKey_reward)
            else
                say("Biologe:")
                say("Du hast mir die 50 Notizen gebracht.")
                say("Nun, ich habe noch eine Bitte.")
                say("Ich benötige den Seelenstein der Anführer,")
                say("den du ebenfalls von den Bossen")
                say("erbeuten kannst.")
                say("Ich denke, dafür bist du stark genug.")
                say("")        
            end
        end
    end
    state bossKey_reward begin
        when letter begin
            send_letter("Sprich mit Baek-Go")
            local v = find_npc_by_vnum(20018)
            if v != 0 then target.vid("__TARGET__", v, "Doktor")
            end
        end
        when button or info begin
            say_title("Sprich mit Baek-Go")
            say("Um die Belohnung des Biologen zu erhalten,")
            say("suche mit den Informationen der")
            say("Notizen und des Seelensteins")
            say("Baek-Go auf. Er befindet sich in der Stadt.")
            say("")
        end
        when __TARGET__.target.click  or 20018.chat."Belohnung des Biologen" begin
            target.delete("__TARGET__")
            say_title("Baek-Go:")
            say("Ich sehe ...")
            say("Der Biologe hat dich zu mir geschickt.")
            say("Hier ist deine Belohnung:")
            say("")
            say_reward("Du erhälst:")
            say_reward("Blauer Ebenholzkasten")
            say_reward("PvP Schadenswert +10% (Dauerhaft)")
            say("")
            affect.add_collect(apply.ATT_BONUS_TO_WARRIOR,10,60*60*24*365*60)
            affect.add_collect(apply.ATT_BONUS_TO_ASSASSIN,10,60*60*24*365*60)
            affect.add_collect(apply.ATT_BONUS_TO_SURA,10,60*60*24*365*60)
            affect.add_collect(apply.ATT_BONUS_TO_SHAMAN,10,60*60*24*365*60)
            pc.give_item2("50114")
            set_state(collect_quest_lv92)
        end
    end

    ----------------------------------
    -- LvL 92 / Juwel der Missgunst
    ----------------------------------

    state collect_quest_lv92 begin 
        when login or levelup with pc.level>91 begin 
            set_state(talk_to_disciple_lv92) 
        end

        when login or levelup with pc.level<92 begin    
            send_letter("Seon-Pyeongs Forschung")
        end
        when button or info begin
            say_title("Seon-Pyeongs Forschung")
            say("")
            say("Um die erste Forschung des Seon-Pyeongs")
            say("zu starten musst du mindestens Lv 92 erreicht")
        say("haben.")
            say("")
            say_reward("Deine Erfahrung reicht im Moment nicht aus")
            say_reward("Du musst mindestens Lv 92 erreichen!")
            say("")
            end
    end
 
    state talk_to_disciple_lv92 begin 
        when letter begin 
            local v = find_npc_by_vnum(20091) 
            if v != 0 then target.vid("__TARGET__", v, "Seon-Pyeong") 
            end 
            send_letter("Seon-Pyeongs Forschung") 
        end     
        when button or info begin 
            say_title("Seon-Pyeongs Forschung") 
            say("") 
            say("Seon-Pyeong benötigt deine Hilfe.") 
            say("Sprich mit ihm.") 
            say("") 
            say_reward("Sprich mit Seon-Pyeong") 
            say("") 
        end 
        when __TARGET__.target.click or 20091.chat."Seon-Pyeongs Forschung" begin 
            target.delete("__TARGET__") 
            say("Seon-Pyeong:") 
            say("") 
            say("Oh, du hilfst mir?") 
            say("Gut ...") 
            say("Ich bin übrigens Seon-Pyeong") 
            say("und studiere zahlreiches aus der Unterwelt.") 
            say("Wenn du mir bei meinen Forschungen hilfst,") 
            say("werde ich dich reich belohnen.") 
            say("") 
            wait() 
            say("Seon-Pyeong:") 
            say("Ich habe vor kurzem wieder angefangen ...") 
            say("Ich Forsche an einer Legende ...") 
            say("Doch habe ich derzeit viel zu tun,") 
            say("es wäre also nett, wenn du mir hilfst ...") 
            say("") 
            wait() 
            say("Seon-Pyeong:") 
            say("Ich benötige zehn Juwele der Missgunst für meine")
            say("Forschung") 
            say("Diese sind jedoch sehr zerbrechlich,") 
            say("es kann also sein, dass einige bei") 
            say("meinen Untersuchungen kaputt gehen.") 
            say("Ich benötige alle zehn,") 
            say("um meine Forschungen vollenden zu können.") 
            say("") 
            set_state(collect_9) 
        end 
    end
    
    state collect_9 begin
        when letter begin
            send_letter("Seon-Pyeongs Forschung")
        end
        when button or info begin
            say_title("Juwel der Missgunst")
            say("")
            say("Seon-Pyeong gab euch den Auftrag,")
            say("10 Juwele der Missgunst zu besorgen.")
            say("Diese kannst du von den Monstern")
            say("Unterwelt Eismann, und Unterwelt Eisgolem")
            say("erbeuten, diese leben jedoch in der")
            say("gefährlichen Grotte der Verbannung.")
            say("")
            say_item_vnum(30251)
            say_reward("Du hast derzeit "..pc.getqf("collect_count").." abgegeben!")
            say("")
        end
        when 1135.kill or 1137.kill begin
            local rand = number(1,10)    -------- Dropchance eines Juwels hier 10%
            if rand<5 then pc.give_item2(30251, 1)
            end
        end
        when 20091.chat."Juwel der Missgunst" with pc.count_item(30251)>0 begin
                say("Einen Moment ...")
                say("Vielen Dank,")
                say("lasst mich schnell überprüfen")
                say("ob dieses Juwel brauchbar ist ...")
                say("")
                pc.remove_item("30251", 1)
                wait()
                local rand = number(0,99)
                if rand>50 then
                        say("Seon-Pyeong:")
                        say("Es tut mir leid, das Juwel")
                        say("hat sich als unbrauchbar herausgestellt,")
                        say("Bitte hol mir ein Neues.")
        else
                    local count = pc.getqf("collect_count")+1
                    if count<10 then
                        pc.setqf("collect_count", count)
                        say("Seon-Pyeong:")
                        say("Hervorragend,")
                        say("dieses Juwel ist in Ordnung.")
                        say("Bringt mir noch welche, damit ich meine")
                        say("Forschungen abschließen kann.")
                        say("")
                        say_reward("Ihr habt derzeit "..pc.getqf("collect_count").." abgegeben!")
                        say("")
                  else 
                        say("Seon-Pyeong:")
                        say("Du hast mir die 10 Juwele gebracht.")
                        say("ich bin beeindruckt,")
                        say("sammle noch mehr Erfahrung in der")
                        say("Grotte der Verbannung dann werde")
                        say("ich dir die nächste Aufgabe zu kommen")
                        say("lassen.")
            say("")
            say("Doch nun zu deiner Belohnung")
                        say("")
                        pc.setqf("collect_count",0)
                        pc.setqf("duration",0)
            wait()
            say("Welche Belohnung möchtest du?")
            local s = select ("1000 TP", "120 Verteidigung", "51 Angriffswert")
            
            if s == 3 then
                say_reward("Du erhälst 51 Angriffswert.")
                affect.add_collect(apply.ATT_GRADE_BONUS,51,60*60*24*365*60)
                set_state(collect_quest_lv94)
            end
            if s == 2 then
                say_reward("Du erhälst 120 Verteidigung.")
                affect.add_collect(apply.DEF_GRADE_BONUS,120,60*60*24*365*60)
                set_state(collect_quest_lv94)
            end
            if s == 1 then
                say_reward("Du erhälst 1000 TP.")
                affect.add_collect(apply.TP_GRADE_BONUS,1000,60*60*24*365*60)
                set_state(collect_quest_lv94)
            end
        end
    end
                        end
            end

    ----------------------------------
    -- LvL 94 / Juwel der Weisheit
    ----------------------------------

state collect_quest_lv94 begin 
        when login or levelup with pc.level>93 begin 
            set_state(talk_to_disciple_lv94) 
        end

        when login or levelup with pc.level<94 begin    
            send_letter("Seon-Pyeongs Forschung 2")
        end
        when button or info begin
            say_title("Seon-Pyeongs Forschung 2")
            say("")
            say("Um die nächste Forschung des Seon-Pyeongs")
            say("zu starten musst du mindestens Lv 94 erreicht")
        say("haben.")
            say("")
            say_reward("Deine Erfahrung reicht im Moment nicht aus")
            say_reward("Du musst mindestens Lv 94 erreichen!")
            say("")
            end
    end
 
    state talk_to_disciple_lv94 begin 
        when letter begin 
            local v = find_npc_by_vnum(20091) 
            if v != 0 then target.vid("__TARGET__", v, "Seon-Pyeong") 
            end 
            send_letter("Seon-Pyeongs Forschung 2") 
        end     
        when button or info begin 
            say_title("Seon-Pyeongs Forschung 2") 
            say("") 
            say("Seon-Pyeong benötigt deine Hilfe.") 
            say("Sprich mit ihm.") 
            say("") 
            say_reward("Sprich mit Seon-Pyeong") 
            say("") 
        end 
        when __TARGET__.target.click or 20091.chat."Seon-Pyeongs Forschung 2" begin 
            target.delete("__TARGET__") 
            say("Seon-Pyeong:")
            say("Gut, dass du gekommen bist...")
            say("Die Untersuchung der Missgunst Juwelen")
            say("habe ich abgeschlossen.")
            say("Nun habe ich neue Objekte gefunden,")
            say("die ich gerne untersuchen würde.")
            wait()
            say("Seon-Pyeong:")
            say("Ich würde sie ja selber sammeln,")
            say("aber ich habe zuviel zu tun...")
            say("Es wäre sehr nett, wenn du dies")
            say("für mich erledigen könntest.")
            wait()
            say("Seon-Pyeong:")
            say("Ich möchte Juwelen der Weisheit untersuchen.")
            say("Davon benötige ich 20 Stück.")
            say("Es kann jedoch sein, dass sich einige")
            say("Juwele als unbrauchbar herausstellen.")
            say("")    
            set_state(collect_10) 
        end 
    end
    
    state collect_10 begin
        when letter begin
            send_letter("Seon-Pyeongs Forschung 2")
        end
        when button or info begin
            say_title("Juwel der Weisheit")
            say("")
            say("Seon-Pyeong gab euch den Auftrag,")
            say("20 Juwelen der Weisheit zu besorgen.")
            say("Diese kannst du von den Monstern")
            say("Setaou Bogenschütze und Setaou")
            say("Kommandant erbeuten, diese leben")
            say("jedoch im den hintersten Kammern")
            say("der Grotte 2.")
            say("")
            say_item_vnum(30252)
            say_reward("Du hast derzeit "..pc.getqf("collect_count").." abgegeben!")
            say("")
        end
        when 2412.kill or 2414.kill begin
            local rand = number(1,25)    -------- Dropchance des Juwels hier 4%
            if rand<5 then pc.give_item2(30252, 1)
            end
        end
        when 20091.chat."Juwel der Weisheit" with pc.count_item(30252)>0 begin
                say("Einen Moment ...")
                say("Vielen Dank,")
                say("lasst mich schnell überprüfen")
                say("ob dieses Juwel brauchbar ist ...")
                say("")
                pc.remove_item("30252", 1)
                wait()
                local rand = number(0,99)
                if rand<50 then
                    local count = pc.getqf("collect_count")+1
                    if count<20 then
                        pc.setqf("collect_count", count)
                        say("Seon-Pyeong:")
                        say("Hervorragend,")
                        say("dieses Juwel ist in Ordnung.")
                        say("Bringt mir noch welche, damit ich meine")
                        say("Forschungen abschließen kann.")
                        say("")
                        say_reward("Ihr habt derzeit "..pc.getqf("collect_count").." abgegeben!")
                        say("")
                    else 
                        say("Seon-Pyeong:")
                        say("Du hast mir die 20 Juwele gebracht.")
                        say("Nun, ich habe noch eine Bitte.")
                        say("Ich benötige den Beran-Setaou Seelenstein,")
                        say("den du nur vom Herrscher der Grotte")
                        say("Beran-Setaou erhälst, es ist eine")
                        say("schwere Aufgabe aber ich denke")
                        say("das du es schaffen wirst!")
                        say("")
                        pc.setqf("collect_count",0)
                        pc.setqf("duration",0) 
                        set_state(collect_setaouseeli)
                    end
                else                                
                    say("Seon-Pyeong:")
                    say("Es tut mir leid, das Juwel")
                    say("hat sich als unbrauchbar herausgestellt.")
                    say("Bitte hol mir ein Neues.")
                end
        end
    end
    state collect_setaouseeli begin
        when letter begin
            send_letter("Beran-Setaou Seelenstein")
        end
        when button or info begin
            say_title("Beran-Setaou Seelenstein")
            say("")
            say("Ihr habt alle 20 Juwele der Weisheit abgegeben.")
            say("Nun müsst ihr den Beran-Setaou Seelenstein")
            say("erbeuten.")
            say("")
            say_item_vnum(30228)
            say("Ob dieser Stein tatsächlich Seelen")
            say("der Grotte enthält?")
            say("")
        end
        when 2493.kill begin
            local rand = number(1,1)    -------- Dropchance des Seelensteins hier 100%
            if rand<5 then pc.give_item2(30228, 1)
                    end
                end   

        when 20091.chat."Beran-Setaou Seelenstein" begin
            if pc.count_item(30228)<1 then
                        say("Seon-Pyeong:")
                        say("Du hast mir die 20 Juwele gebracht.")
                        say("Nun, ich habe noch eine Bitte.")
                        say("Ich benötige den Beran-Setaou Seelenstein,")
                        say("den du nur vom Herrscher der Grotte")
                        say("Beran-Setaou erhälst, es ist eine")
                        say("schwere Aufgabe aber ich denke")
                        say("das du es schaffen wirst!")
                        say("")
            else 
                say("Seon-Pyeong:")
                say("Unglaublich! Du hast es tatsächlich geschafft")
                say("mir den Beran-Setaou Seelenstein zu besorgen")
                say("Du hast hart gekämpft.")
                say("")
                say("Nun zu deiner Belohnung")
                say("")
                pc.remove_item(30228,1)
        wait()
            say("Welche Belohnung möchtest du?")
            local s = select ("1100 TP", "140 Verteidigung", "60 Angriffswert")
            
            if s == 3 then
                say_reward("Du erhälst 60 Angriffswert.")
        affect.add_collect(apply.ATT_GRADE_BONUS,60,60*60*24*365*60)
                        set_state(collect_end)
            end
            if s == 2 then
                say_reward("Du erhälst 140 Verteidigung.")
                affect.add_collect(apply.DEF_GRADE_BONUS,140,60*60*24*365*60)
                        set_state(collect_end)
            end
            if s == 1 then
                say_reward("Du erhälst 1100 TP.")
                affect.add_collect(apply.TP_GRADE_BONUS,1100,60*60*24*365*60)
                        set_state(collect_end)    
                            end
                    end
            end
        end

    state collect_end begin
            end
        end 